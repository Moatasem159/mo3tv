import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/functions/pagination.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_image.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/image_list_title.dart';
class BackdropsList extends StatefulWidget {
  final List<ImageEntity> backdrops;
  const BackdropsList({super.key, required this.backdrops});
  @override
  State<BackdropsList> createState() => _BackdropsListState();
}
class _BackdropsListState extends State<BackdropsList> {
  int _page = 0;
  final int _perPage = 10;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        ImageListTitle(length: widget.backdrops.length,title: AppStrings.backdrops),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.6,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 7),
          delegate: SliverChildBuilderDelegate(
            childCount: widget.backdrops.length>10? pagination(widget.backdrops,_page,_perPage).length:widget.backdrops.length,
                (context, index) {
              return GalleryImage(image:widget.backdrops.length>10? pagination(widget.backdrops,_page,_perPage)[index]:
              widget.backdrops[index]);
            },
          ),
        ),
        if(widget.backdrops.length>10)
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_page!=0)
              MainButton(
                  size: const Size(70,20),
                  radius: 5,
                  onPressed: (){
                    setState(() {
                      _page -= 1;
                    });
                  },
                  label: AppStrings.previous.tr(context)!),
              if(((_page * _perPage) + _perPage)<widget.backdrops.length&&_page>0)
              100.pw,
              if(((_page * _perPage) + _perPage)<widget.backdrops.length)
              MainButton(
                  size: const Size(20,35),
                  radius: 5,
                  onPressed: (){
                        setState(() {
                          _page += 1;
                        });
                  }, label: AppStrings.next.tr(context)!),
            ],
          ),
        ),
      ],
    );
  }
}
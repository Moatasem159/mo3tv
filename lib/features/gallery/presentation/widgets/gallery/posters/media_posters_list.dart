import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/functions/pagination.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_image.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/image_list_title.dart';
class MediaPostersList extends StatefulWidget {
  final List<ImageEntity> posters;
  const MediaPostersList ({Key? key, required this.posters}) : super(key: key);
  @override
  State<MediaPostersList> createState() => _MediaPostersListState();
}
class _MediaPostersListState extends State<MediaPostersList> {
  int _page = 0;
  final int _perPage = 12;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        ImageListTitle(length: widget.posters.length,title: AppStrings.posters),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              mainAxisExtent: 130,
              crossAxisCount: 4,
              mainAxisSpacing: 7,
              crossAxisSpacing: 5),
          delegate: SliverChildBuilderDelegate(
            childCount: widget.posters.length>12? pagination(widget.posters,_page,_perPage).length:widget.posters.length,
                (context, index) {
              return GalleryImage(image:widget.posters.length>12? pagination(widget.posters,_page,_perPage)[index]:
              widget.posters[index]);
            },
          ),
        ),
        if(widget.posters.length>12)
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
                if(((_page * _perPage) + _perPage)<widget.posters.length&&_page>0)
                  100.pw,
                if(((_page * _perPage) + _perPage)<widget.posters.length)
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
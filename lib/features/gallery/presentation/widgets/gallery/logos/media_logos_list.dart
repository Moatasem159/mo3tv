import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/functions/pagination.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_image.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/imgae_list_title.dart';
class MediaLogosList extends StatefulWidget {
  final List<ImageEntity> logos;
  const MediaLogosList({Key? key, required this.logos}) : super(key: key);
  @override
  State<MediaLogosList> createState() => _MediaLogosListState();
}
class _MediaLogosListState extends State<MediaLogosList> {
  int _page = 0;
  final int _perPage = 4;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        ImageListTitle(length: widget.logos.length,title: "Logos"),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 7),
          delegate: SliverChildBuilderDelegate(
            childCount:widget.logos.length>4? pagination(widget.logos,_page,_perPage).length:widget.logos.length,
                (context, index) {
                  return GalleryImage(image:widget.logos.length>4? pagination(widget.logos,_page,_perPage)[index]:
                  widget.logos[index]);
          }

        ),
        ),
        SliverToBoxAdapter(child: 20.ph),
        if(widget.logos.length>4)
        SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(_page>0)
                MainButton(
                    size: const Size(70,35),
                    radius: 5,
                    onPressed: (){
                      setState(() {
                          _page -= 1;
                        });
                    },
                    label: "prev"),
                if(((_page * _perPage) + _perPage)<widget.logos.length&&_page>0)
                100.pw,
                if(((_page * _perPage) + _perPage)<widget.logos.length)
                MainButton(
                    size: const Size(70,35),
                    radius: 5,
                    onPressed: (){
                        setState(() {
                          _page += 1;
                        });
                    }, label: "next"),
              ],
            ),
          ),
        SliverToBoxAdapter(child: 70.ph),
      ],
    );
  }
}
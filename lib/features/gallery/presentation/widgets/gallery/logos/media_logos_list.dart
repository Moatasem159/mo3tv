import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/functions/pagination.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_image.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/image_list_title.dart';
class MediaLogosList extends StatefulWidget {
  final List<ImageEntity> logos;
  const MediaLogosList({Key? key, required this.logos}) : super(key: key);
  @override
  State<MediaLogosList> createState() => _MediaLogosListState();
}
class _MediaLogosListState extends State<MediaLogosList> {
  late List<ImageEntity>_logos;
  String getFileExtension(String fileName) {
    return ".${fileName.split('.').last}";
  }
  @override
  void initState() {
    super.initState();
    _logos=[];
    for (var element in widget.logos) {
      if(getFileExtension(element.filePath!)!=".svg"){
        _logos.add(element);
      }
    }
  }
  int _page = 0;
  final int _perPage = 4;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        ImageListTitle(length:_logos.length,title: AppStrings.logos),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 7),
          delegate: SliverChildBuilderDelegate(
            childCount:_logos.length>4? pagination(_logos,_page,_perPage).length:_logos.length,
                (context, index) {
                  return GalleryImage(image:_logos.length>4? pagination(_logos,_page,_perPage)[index]:
                  _logos[index]);
          }

        ),
        ),
        SliverToBoxAdapter(child: 20.ph),
        if(_logos.length>4)
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
                    label: AppStrings.previous.tr(context)!),
                if(((_page * _perPage) + _perPage)<_logos.length&&_page>0)
                100.pw,
                if(((_page * _perPage) + _perPage)<_logos.length)
                MainButton(
                    size: const Size(70,35),
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
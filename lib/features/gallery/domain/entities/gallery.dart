import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
class Gallery {
  List<ImageEntity> backdrops;
  List<ImageEntity> logos;
  List<ImageEntity> posters;
  Gallery({required this.backdrops, required this.logos, required this.posters});
}
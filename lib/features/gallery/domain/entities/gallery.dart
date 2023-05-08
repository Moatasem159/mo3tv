import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
class Gallery {
  List<ImageEntity>? backdrops;
  List<ImageEntity>? logos;
  List<ImageEntity>? posters;
  Gallery({this.backdrops, this.logos, this.posters});
}

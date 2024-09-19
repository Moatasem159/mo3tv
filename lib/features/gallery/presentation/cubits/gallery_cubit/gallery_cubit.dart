import 'package:mo3tv/core/api/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/functions/get_file_extension.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/gallery/domain/usecases/get_media_gallery_usecase.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit(this._getMediaGalleryUsecase)
      : super(GetMediaGalleryLoadingState());

  static GalleryCubit get(context) => BlocProvider.of(context);
  final GetMediaGalleryUsecase _getMediaGalleryUsecase;
  late int mediaId;
  late String mediaType;
  bool isEmpty = false;

  Future<void> getMediaGallery() async {
    Gallery gallery = Gallery(
      backdrops: [],
      logos: [],
      posters: [],
    );
    ApiResult<Gallery> response = await _getMediaGalleryUsecase(
        MediaParams(mediaId: mediaId, mediaType: mediaType));
    switch (response) {
      case ApiSuccess<Gallery>():
        for (ImageEntity element in response.data.backdrops) {
          if (element.iso6391 == "en" || element.iso6391 == "ar") {
            gallery.backdrops.add(element);
          }
        }
        for (ImageEntity element in response.data.posters) {
          if (element.iso6391 == "en" || element.iso6391 == "ar") {
            gallery.posters.add(element);
          }
        }
        for (ImageEntity element in response.data.logos) {
          if (element.iso6391 == "en" || element.iso6391 == "ar") {
            if (getFileExtension(element.filePath) != ".svg") {
              gallery.logos.add(element);
            }
          }
        }
        if (gallery.backdrops.isEmpty &&
            gallery.posters.isEmpty &&
            gallery.logos.isEmpty) {
          isEmpty = true;
        }
        emit(GetMediaGallerySuccessState(gallery));
      case ApiFailure<Gallery>():
        emit(GetMediaGalleryErrorState(msg: mapFailureToMsg(response.failure)));
    }
  }
}
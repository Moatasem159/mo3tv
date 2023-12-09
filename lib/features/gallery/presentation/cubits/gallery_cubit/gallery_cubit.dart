import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/usecases/get_media_gallery_usecase.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit/gallery_state.dart';
class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit(this._getMediaGalleryUsecase) : super(GalleryInitialState());
  static GalleryCubit get(context)=>BlocProvider.of(context);
  final GetMediaGalleryUsecase _getMediaGalleryUsecase;
  late int mediaId;
  late String mediaType;
  Future<void> getMediaGallery() async {
    emit(GetMediaGalleryLoadingState());
    Gallery gallery=Gallery(
      backdrops: [],
      logos: [],
      posters: [],
    );
    Either<Failure, Gallery> response =
    await _getMediaGalleryUsecase.call(MediaParams(mediaId: mediaId, mediaType: mediaType));
    emit(response.fold((failure) => GetMediaGalleryErrorState(msg: mapFailureToMsg(failure)),
            (mediaGallery) {
          for (var element in mediaGallery.backdrops){
            if(element.iso6391=="en"||element.iso6391=="ar")
            {
              gallery.backdrops.add(element);
            }
          }
          for (var element in mediaGallery.posters){
            if(element.iso6391=="en"||element.iso6391=="ar")
            {
              gallery.posters.add(element);
            }
          }
          for (var element in mediaGallery.logos){
            if(element.iso6391=="en"||element.iso6391=="ar")
            {
              gallery.logos.add(element);
            }
          }
          return GetMediaGallerySuccessState(gallery);
        }));
  }
}
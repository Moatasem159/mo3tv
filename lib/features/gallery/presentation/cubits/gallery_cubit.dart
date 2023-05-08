import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/usecases/get_media_gallery_usecase.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_state.dart';
class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit(this._getMediaGalleryUsecase) : super(GalleryInitialState());
  static GalleryCubit get(context)=>BlocProvider.of(context);
  final GetMediaGalleryUsecase _getMediaGalleryUsecase;
  int ?mediaId;
  String ?mediaType;
  Future<void> getMediaGallery({required mediaId,required mediaType}) async {
    emit(GetMediaGalleryLoadingState());
    this.mediaId=mediaId;
    this.mediaType=mediaType;
    Gallery gallery=Gallery(
      backdrops: [],
      logos: [],
      posters: [],
    );
    Either<Failure, Gallery> response =
    await _getMediaGalleryUsecase.call(mediaType: mediaType,mediaId: mediaId);
    emit(response.fold((failure) => GetMediaGalleryErrorState(msg: mapFailureToMsg(failure)),
            (mediaGallery) {
          for (var element in mediaGallery.backdrops!){
            if(element.iso6391=="en")
            {
              gallery.backdrops!.add(element);
            }
          }
          for (var element in mediaGallery.posters!){
            if(element.iso6391=="en")
            {
              gallery.posters!.add(element);
            }
          }
          for (var element in mediaGallery.logos!){
            if(element.iso6391=="en")
            {
              gallery.logos!.add(element);
            }
          }
          return GetMediaGallerySuccessState(gallery);
        }));
  }

  initial(context){
    GalleryNavigatorCubit.get(context).index=0;
    emit(GalleryInitialState());
  }
 bool isInitial(){
    return state is GalleryInitialState;
  }
}
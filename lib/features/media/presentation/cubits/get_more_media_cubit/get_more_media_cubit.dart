import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/domain/usecases/get_discover_media_list.dart';
import 'package:mo3tv/features/media/domain/usecases/get_media_list_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/get_similar_media_usecase.dart';
part 'get_more_media_states.dart';
class GetMoreMediaCubit extends Cubit<GetMoreMediaStates> {
  GetMoreMediaCubit(this._getMediaListUsecase,this._getDiscoverMediaListUsecase,this._getSimilarMediaListUsecase,this._params) : super(GetMoreMediaInitialState()){
    page=1;
    mediaList=[];
  }
  final GetMediaListUsecase _getMediaListUsecase;
  final GetSimilarMediaListUsecase _getSimilarMediaListUsecase;
  final GetDiscoverMediaListUsecase _getDiscoverMediaListUsecase;
  final MediaParams _params;
  static GetMoreMediaCubit get(context) => BlocProvider.of(context);
  late List<Media> mediaList;
  late int page;
  getMoreMedia() async {
    emit(GetMoreMediaLoadingState());
     Either<Failure, List<Media>> response;
    if(_params.moreType==AppStrings.recommendations)
      {
       response=await _getMediaRecommendation();
      }
    else if(_params.moreType==AppStrings.similar){
      response=await _getSimilarMovies();
    }
    else{
     response=await  _getMoreMedia();
    }
    emit(response.fold((failure) => GetMoreMediaErrorState(),(media) {
      if(media.isEmpty)
        {
          return GetMoreMediaSuccessState(true);
        }
      mediaList.addAll(media);
      mediaList = mediaList.toSet().toList();
      return GetMoreMediaSuccessState(false);
    }));
  }
  Future<Either<Failure, List<Media>>> _getMoreMedia()async{
    page++;
    MediaParams params=MediaParams(lang: AppStrings.appLang,page: page, mediaType: _params.mediaType,listType:_params.listType);
    return params.listType==AppStrings.discover?await _getDiscoverMediaListUsecase(params):await _getMediaListUsecase(params);
  }
  Future<Either<Failure, List<Media>>> _getMediaRecommendation()async{
    return await _getSimilarMediaListUsecase(MediaParams(lang: AppStrings.appLang,mediaId:_params.mediaId,page: 1, mediaType: _params.mediaType,listType:_params.listType,moreType:_params.moreType));

  }
  Future<Either<Failure, List<Media>>> _getSimilarMovies()async{
    page++;
    return await _getSimilarMediaListUsecase(MediaParams(lang: AppStrings.appLang,mediaId: _params.mediaId,page:page, mediaType: _params.mediaType,listType:_params.listType,moreType:_params.moreType));
  }
}
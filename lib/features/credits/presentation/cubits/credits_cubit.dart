import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/usecases/get_media_credits_usecase.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_state.dart';
class CreditsCubit extends Cubit<CreditsStates> {
  CreditsCubit(this._getMediaCreditsUsecase) : super(CreditsInitialState());
  static CreditsCubit get(context)=>BlocProvider.of(context);
  final GetMediaCreditsUsecase _getMediaCreditsUsecase;
  int ?mediaId;
  String ?mediaType;
  Future<void> getMovieCredits({required mediaId,required mediaType}) async {
    emit(GetMediaCreditsLoadingState());
    this.mediaId=mediaId;
    this.mediaType=mediaType;
    Either<Failure, List<CastMember>> response =
    await _getMediaCreditsUsecase.call(mediaId: mediaId,mediaType:mediaType);
    List<CastMember>? credits= [];
    emit(response.fold(
            (failure) =>
            GetMediaCreditsErrorState(msg: mapFailureToMsg(failure)),
            (mediaCredits) {
          for (var element in mediaCredits) {
            if(element.profilePath!='')
            {
              credits.add(element);
            }
          }
          return GetMediaCreditsSuccessState(credits);
        }));
  }
  initial(){
    emit(CreditsInitialState());
  }
  bool isInitial(){
    return state is CreditsInitialState;
  }
}
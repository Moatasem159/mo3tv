import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/credits/domain/usecases/get_media_credits_usecase.dart';
part 'credits_state.dart';
class CreditsCubit extends Cubit<CreditsStates> {
  CreditsCubit(this._getMediaCreditsUsecase) : super(GetMediaCreditsLoadingState());
  static CreditsCubit get(context)=>BlocProvider.of(context);
  final GetMediaCreditsUsecase _getMediaCreditsUsecase;
  late int mediaId;
  late String mediaType;
  Future<void> getMediaCredits() async {
    Either<Failure, List<CastMember>> response = await _getMediaCreditsUsecase(MediaParams(mediaId: mediaId,mediaType: mediaType));
    emit(response.fold(
        (failure) => GetMediaCreditsErrorState(),
        (mediaCredits)=> GetMediaCreditsSuccessState(mediaCredits)));
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/usecases/get_media_credits_usecase.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_state.dart';
class CreditsCubit extends Cubit<CreditsStates> {
  CreditsCubit(this._getMediaCreditsUsecase) : super(CreditsInitialState());
  static CreditsCubit get(context)=>BlocProvider.of(context);
  final GetMediaCreditsUsecase _getMediaCreditsUsecase;
  late int mediaId;
  late String mediaType;
  Future<void> getMediaCredits() async {
    emit(GetMediaCreditsLoadingState());
    Either<Failure, List<CastMember>> response =
    await _getMediaCreditsUsecase.call(MediaParams(mediaId: mediaId,mediaType: mediaType));
    emit(response.fold(
        (failure) => GetMediaCreditsErrorState(),
        (mediaCredits)=> GetMediaCreditsSuccessState(mediaCredits)));
  }
}
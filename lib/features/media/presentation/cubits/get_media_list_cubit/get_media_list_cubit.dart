import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/data/models/media_model.dart';
import 'package:mo3tv/features/media/domain/usecases/get_discover_media_list.dart';
import 'package:mo3tv/features/media/domain/usecases/get_media_list_usecase.dart';

part 'get_media_list_states.dart';

class GetMediaListCubit extends HydratedCubit<GetMediaListStates> {
  GetMediaListCubit(
      this._getMediaListUsecase, this._getDiscoverMediaListUsecase, this.params)
      : super(GetMediaListInitialState());
  final GetMediaListUsecase _getMediaListUsecase;
  final GetDiscoverMediaListUsecase _getDiscoverMediaListUsecase;
  final MediaParams params;

  static GetMediaListCubit get(context) => BlocProvider.of(context);

  Future<void> getMediaList() async {
    if (state is! GetMediaListSuccessState) {
      emit(GetMediaListLoadingState());
      MediaParams param = MediaParams(
          lang: AppStrings.appLang,
          mediaType: params.mediaType,
          listType: params.listType);
      Either<Failure, List<Media>> response =
          param.listType == AppStrings.discover
              ? await _getDiscoverMediaListUsecase(param)
              : await _getMediaListUsecase(param);
      emit(response.fold(
          (failure) => GetMediaListErrorState(msg: mapFailureToMsg(failure)),
          (media) => GetMediaListSuccessState(
              media, DateTime.now().toIso8601String(), AppStrings.appLang)));
    }
  }

  @override
  String get id => "${params.mediaType}${params.listType}";

  @override
  GetMediaListStates? fromJson(Map<String, dynamic> json) {
    if (json["lang"] == AppStrings.appLang &&
        (params.listType == AppStrings.discover
            ? DateTime.now().difference(DateTime.parse(json["time"])).inHours <
                5
            : DateTime.now().difference(DateTime.parse(json["time"])).inHours <
                1)) {
      return GetMediaListSuccessState.fromMap(json);
    } else {
      clear();
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(GetMediaListStates state) {
    if (state is GetMediaListSuccessState) {
      return state.toMap();
    } else {
      return null;
    }
  }
}
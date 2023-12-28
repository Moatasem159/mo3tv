import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/get_tv_shows_list_cubit/get_tv_shows_list_state.dart';
class GetTvShowsListCubit extends HydratedCubit<GetTvShowsListStates> {
  GetTvShowsListCubit(this._getNowPlayingTvShowsUsecase, this.listType) : super(GetTvShowsListInitialState());
  static GetTvShowsListCubit get(context)=>BlocProvider.of(context);
  final GetTvShowsListUsecase _getNowPlayingTvShowsUsecase;
  final String listType;
  Future<void> getNowPlayingTvShowsData() async {
    if(state is! GetTvShowsListSuccessState)
    {
      emit(GetTvShowsListLoadingState());
      Either<Failure, List<TvShow>> response = await _getNowPlayingTvShowsUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.tv,listType: listType));
      emit(response.fold(
              (failure) =>GetTvShowsListErrorState(msg: mapFailureToMsg(failure)),
              (playingTvShows) =>GetTvShowsListSuccessState(playingTvShows,DateTime.now().toIso8601String(),AppStrings.appLang)));
    }
  }
  @override
  String get id=>listType;
  @override
  GetTvShowsListStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetTvShowsListSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(GetTvShowsListStates state) {
    if(state is GetTvShowsListSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}
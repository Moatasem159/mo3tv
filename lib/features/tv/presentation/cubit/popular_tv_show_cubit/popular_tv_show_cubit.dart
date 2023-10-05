import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_state.dart';
class PopularTvShowCubit extends HydratedCubit<PopularTvShowStates> {
  PopularTvShowCubit(this._getPopularTvShowsUsecase) : super(PopularTvShowInitialState());
  static PopularTvShowCubit get(context)=>BlocProvider.of(context);
  final GetTvShowsListUsecase _getPopularTvShowsUsecase;
  Future<void> getPopularTvShowsData() async {
   if(state is! GetPopularTvShowsSuccessState)
     {
       emit(GetPopularTvShowsLoadingState());
       Either<Failure, List<TvShow>> response = await _getPopularTvShowsUsecase.call(listType: "popular",lang:AppStrings.appLang);
       emit(response.fold(
               (failure) =>GetPopularTvShowsErrorState(msg: mapFailureToMsg(failure)),
               (popularTvShows) =>GetPopularTvShowsSuccessState(popularTvShows,DateTime.now().toIso8601String(),AppStrings.appLang)));
     }
  }
  @override
  PopularTvShowStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetPopularTvShowsSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(PopularTvShowStates state) {
    if(state is GetPopularTvShowsSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}
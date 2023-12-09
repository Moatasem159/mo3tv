import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
class TrendingMovieCubit extends HydratedCubit<TrendingMovieStates> {
  TrendingMovieCubit(this._getTrendingMoviesUsecase) : super(TrendingMovieInitialState());
  final GetTrendingMoviesUsecase _getTrendingMoviesUsecase;
  static TrendingMovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getTrendingMoviesData() async {
    if (state is! GetTrendingMoviesSuccessState)
    {
      emit(GetTrendingMoviesLoadingState());
      Either<Failure, List<Movie>> response = await _getTrendingMoviesUsecase
          .call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.movie));
      emit(response.fold(
          (failure) =>GetTrendingMoviesErrorState(msg: mapFailureToMsg(failure)),
          (trendingMovies) => GetTrendingMoviesSuccessState(trendingMovies, DateTime.now().toIso8601String(), AppStrings.appLang)));
    }
  }
  @override
  TrendingMovieStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetTrendingMoviesSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(TrendingMovieStates state) {
    if(state is GetTrendingMoviesSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}
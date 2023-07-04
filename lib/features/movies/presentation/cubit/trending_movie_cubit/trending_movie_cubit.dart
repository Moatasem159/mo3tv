import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
class TrendingMovieCubit extends Cubit<TrendingMovieStates> {
  TrendingMovieCubit(this._getTrendingMoviesUsecase) : super(TrendingMovieInitialState());
  final GetTrendingMoviesUsecase _getTrendingMoviesUsecase;
  static TrendingMovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getTrendingMoviesData() async {
    emit(GetTrendingMoviesLoadingState());
    Either<Failure,List<Movie>> response = await _getTrendingMoviesUsecase.call(lang:AppStrings.appLang);
    emit(response.fold(
        (failure) =>GetTrendingMoviesErrorState(msg: mapFailureToMsg(failure)),
        (trendingMovies) =>GetTrendingMoviesSuccessState(trendingMovies:trendingMovies)));
  }
}
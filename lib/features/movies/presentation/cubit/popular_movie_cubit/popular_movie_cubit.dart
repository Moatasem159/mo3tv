import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
class PopularMovieCubit extends Cubit<PopularMovieStates> {
  PopularMovieCubit(this._popularMoviesUsecase) : super(PopularMovieInitialState());
  final GetMoviesListUsecase _popularMoviesUsecase;
  static PopularMovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getPopularMoviesData() async {
    emit(GetPopularMoviesLoadingState());
    Either<Failure, List<Movie>> response=await _popularMoviesUsecase.call(listType: "popular",lang:AppStrings.appLang);
    emit(response.fold(
        (failure)=>GetPopularMoviesErrorState(msg: mapFailureToMsg(failure)),
        (popularMovies)=>GetPopularMoviesSuccessState(popularMovies)));
  }
}
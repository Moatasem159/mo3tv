import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_similar_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_state.dart';
class SimilarMovieCubit extends Cubit<SimilarMovieStates> {
  SimilarMovieCubit(this._getSimilarMovieUseCase) : super(SimilarMovieInitialState());
  final GetSimilarMovieUseCase _getSimilarMovieUseCase;
  static SimilarMovieCubit get(context)=>BlocProvider.of(context);
  List<Movie> movies=[];
  bool allMovies=false;
  int page=0;
  Future<void> getSimilarMovies({required int movieId}) async {
    emit(GetSimilarMoviesLoadingState());
    page++;
    Either<Failure, List<Movie>> response = await _getSimilarMovieUseCase.call(movieId: movieId,page: page);
    emit(response.fold((failure) => GetSimilarMoviesErrorState(msg: mapFailureToMsg(failure)),
            (similarMovies) {
      if(similarMovies.isEmpty)
        {
          allMovies=true;
           return GetSimilarMoviesSuccessState();
        }
          for (var element in similarMovies) {
            if(element.posterPath!=''&&element.backdropPath!="")
            {
              if(!movies.contains(element))
                {
                  movies.add(element);
                }
            }
          }
          return GetSimilarMoviesSuccessState();
        }));
  }
}
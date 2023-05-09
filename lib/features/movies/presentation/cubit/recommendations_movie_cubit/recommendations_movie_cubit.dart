import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_state.dart';
class RecommendationsMovieCubit extends Cubit<RecommendationsMovieStates> {
  RecommendationsMovieCubit(this._getMovieRecommendationsUseCase) : super(RecommendationsMovieInitialState());
  static RecommendationsMovieCubit get(context)=>BlocProvider.of(context);
  final GetMovieRecommendationsUseCase _getMovieRecommendationsUseCase;
  bool isLast=true;
  List<int> moviesIds=[];
  Future<void> getMovieRecommendations({required  movieId}) async {
    emit(GetMovieRecommendationsLoadingState());
    List<Movie> movieRecommendations=[];
    Either<Failure, List<Movie>> response =
    await _getMovieRecommendationsUseCase.call(movieId: movieId);
    emit(response.fold((failure) => GetMovieRecommendationsErrorState(msg: mapFailureToMsg(failure)),
            (recommendations) {
          for (var element in recommendations) {
            if(element.posterPath!=''&&element.backdropPath!="")
            {
              movieRecommendations.add(element);
            }
          }
          return GetMovieRecommendationsSuccessState(movieRecommendations);
        }));
  }


  initial(){
    emit(RecommendationsMovieInitialState());
  }

  add(movieId){
  moviesIds.add(movieId);
  if(moviesIds.length>=2)
    {
      isLast=false;
    }
  emit(RecommendationsMovieInitialState());
}
  getList(){
    if(moviesIds.length==1&&isLast==false)
      {
            getMovieRecommendations(movieId: moviesIds.last);
            moviesIds.clear();
            isLast=true;
      }
    else if(moviesIds.length>=2)
      {
        getMovieRecommendations(movieId: moviesIds[moviesIds.length-2]);
        moviesIds.removeLast();
        if(moviesIds.length==1)
          {
            isLast=true;
          }
      }
    else{
      moviesIds.removeLast();
      isLast=true;
      emit(RecommendationsMovieInitialState());
    }
  }
  bool isInitial(){
    return state is RecommendationsMovieInitialState;
  }
}

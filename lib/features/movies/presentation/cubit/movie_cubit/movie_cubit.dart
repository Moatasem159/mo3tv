import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
class MovieCubit extends Cubit<MovieStates> {
  MovieCubit(this._getMovieDetailsUseCase) : super(MoviesInitialState());
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  static MovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getMovieDetailsData({required int movieId,required String lang}) async {
    emit(GetMovieDetailsLoadingState());
    Movie movie;
    Either<Failure,Movie> response =
    await _getMovieDetailsUseCase.call(movieId: movieId,lang: lang);
    emit(response.fold((failure) =>GetMovieDetailsErrorState(msg: mapFailureToMsg(failure))
        ,(movieData) {
          movie = movieData;
          for (var element in movie.videos!) {
            if(element.name=="Official Trailer")
            {
              movie.trailer =element;
              break;
            }
            else if(element.name=="Official Teaser")
              {
                movie.trailer =element;
                break;
              }
            else if(element.type=="Trailer")
            {
              movie.trailer =element;
              break;
            }
          }
          movie.videos!.clear();
      return GetMovieDetailsSuccessState(movie);
        }));
  }

  bool isSuccess(){
    return state is GetMovieDetailsSuccessState;
  }
}
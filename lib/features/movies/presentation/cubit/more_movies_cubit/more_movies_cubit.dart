import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';

class MoreMoviesCubit extends Cubit<MoreMoviesStates> {
  MoreMoviesCubit({
    required this.popularMoviesUsecase,
    required this.getTopRatedMoviesUsecase,
    required this.getTrendingMoviesUsecase}) : super(MoreMoviesInitialState());
  GetPopularMoviesUsecase popularMoviesUsecase;
  GetTrendingMoviesUsecase getTrendingMoviesUsecase;
  GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  List<Movie> moreMovies=[];
  int page=1;

  seeMoreMovies({required int index})async{
    emit(GetMoreMoviesLoadingState());
    Either<Failure, List<Movie>>? response;
    page++;
    if(index==1)
      {
         response = await getTrendingMoviesUsecase.call(page);
      }
    else if(index==2)
      {
        response = await popularMoviesUsecase.call(page);
      }
    else if(index ==3)
      {
        response = await getTopRatedMoviesUsecase.call(page);
      }
    emit(response!.fold(
            (failure) {
          return GetMoreMoviesErrorState(msg: _mapFailureToMsg(failure));
        },
            (moreMovies) {
              for (var element in moreMovies) {
                if (element.backdropPath != "" && element.posterPath != "") {
                  if (!this.moreMovies.any(
                        (e) => e.id == element.id,
                  )) {
                    this.moreMovies.add(element);
                  }
                }
              }
          return GetMoreMoviesSuccessState();
        }));

  }
  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      default:
        return " error";
    }
  }
}

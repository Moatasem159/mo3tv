import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';
class MoreMoviesCubit extends Cubit<MoreMoviesStates> {
  MoreMoviesCubit(this._getTrendingMoviesUsecase,this._getMoviesListUsecase) : super(MoreMoviesInitialState());
  final GetTrendingMoviesUsecase _getTrendingMoviesUsecase;
  final GetMoviesListUsecase _getMoviesListUsecase;
  static MoreMoviesCubit get(context)=>BlocProvider.of(context);
  List<Movie> moreMovies=[];
  int page=1;
  seeMoreMovies({required int index})async{
    emit(GetMoreMoviesLoadingState());
    Either<Failure, List<Movie>>? response;
    page++;
    if(index==1)
      {
         response = await _getTrendingMoviesUsecase.call(page: page);
      }
    else if(index==2)
      {
        response = await _getMoviesListUsecase.call(page: page,listType: "popular");
      }
    else if(index ==3)
      {
        response = await _getMoviesListUsecase.call(page: page,listType: "top_rated");
      }
    emit(response!.fold(
            (failure) {
          return GetMoreMoviesErrorState(msg: mapFailureToMsg(failure));
        },
            (moreMovies) {
              for (var element in moreMovies) {
                this.moreMovies.add(element);
              }
          return GetMoreMoviesSuccessState();
        }));
  }
}

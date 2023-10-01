import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';
class MoreMoviesCubit extends Cubit<MoreMoviesStates> {
  MoreMoviesCubit(this._getTrendingMoviesUsecase, this._getMoviesListUsecase) : super(MoreMoviesInitialState()){
    page=1;
    moreMovies=[];
  }
  final GetTrendingMoviesUsecase _getTrendingMoviesUsecase;
  final GetMoviesListUsecase _getMoviesListUsecase;
  static MoreMoviesCubit get(context) => BlocProvider.of(context);
  late List<Movie> moreMovies;
  late int page;
  seeMoreMovies({required int index}) async {
    emit(GetMoreMoviesLoadingState());
    Either<Failure, List<Movie>>? response;
    page++;
    if (index == 1) {
      response = await _getTrendingMoviesUsecase.call(page: page, lang: AppStrings.appLang);
    } else if (index == 2) {
      response = await _getMoviesListUsecase.call(page: page, listType: "popular", lang: AppStrings.appLang);
    } else if (index == 3) {
      response = await _getMoviesListUsecase.call(page: page, listType: "top_rated", lang: AppStrings.appLang);
    }
    emit(response!.fold((failure) => GetMoreMoviesErrorState(),(moreMovies) {
      this.moreMovies.addAll(moreMovies);
      this.moreMovies = this.moreMovies.toSet().toList();
      return GetMoreMoviesSuccessState();
    }));
  }
}
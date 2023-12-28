import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';
class MoreMoviesCubit extends Cubit<MoreMoviesStates> {
  MoreMoviesCubit(this._getMoviesListUsecase) : super(MoreMoviesInitialState()){
    page=1;
    moreMovies=[];
  }
  final GetMoviesListUsecase _getMoviesListUsecase;
  static MoreMoviesCubit get(context) => BlocProvider.of(context);
  late List<Movie> moreMovies;
  late int page;
  seeMoreMovies({required int index}) async {
    emit(GetMoreMoviesLoadingState());
    Either<Failure, List<Movie>>? response;
    page++;
    if (index == 1) {
      response = await _getMoviesListUsecase.call(MediaParams(page: page, lang: AppStrings.appLang,mediaType: AppStrings.movie,listType: AppStrings.trending));
    } else if (index == 2) {
      response = await _getMoviesListUsecase.call(MediaParams(page: page, lang: AppStrings.appLang,mediaType: AppStrings.movie,listType:AppStrings.popular));
    } else if (index == 3) {
      response = await _getMoviesListUsecase.call(MediaParams(page: page, lang: AppStrings.appLang,mediaType: AppStrings.movie,listType: AppStrings.topRated));
    }
    emit(response!.fold((failure) => GetMoreMoviesErrorState(),(moreMovies) {
      this.moreMovies.addAll(moreMovies);
      this.moreMovies = this.moreMovies.toSet().toList();
      return GetMoreMoviesSuccessState();
    }));
  }
}
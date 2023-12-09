import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
class PopularMovieCubit extends HydratedCubit<PopularMovieStates> {
  PopularMovieCubit(this._popularMoviesUsecase) : super(PopularMovieInitialState());
  final GetMoviesListUsecase _popularMoviesUsecase;
  static PopularMovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getPopularMoviesData() async {
    if(state is! GetPopularMoviesSuccessState)
   {
     emit(GetPopularMoviesLoadingState());

     Either<Failure, List<Movie>> response=await _popularMoviesUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.movie,listType: "popular"));
     emit(response.fold(
             (failure)=>GetPopularMoviesErrorState(msg: mapFailureToMsg(failure)),
             (popularMovies)=>GetPopularMoviesSuccessState(popularMovies,DateTime.now().toIso8601String(),AppStrings.appLang)));
   }
  }
  @override
  PopularMovieStates? fromJson(Map<String, dynamic> json) {
   if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
   {
     return GetPopularMoviesSuccessState.fromMap(json);
   }
   else {
     clear();
     return null;
   }
  }
  @override
  Map<String, dynamic>? toJson(PopularMovieStates state) {
    if(state is GetPopularMoviesSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}
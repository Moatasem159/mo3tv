import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
class TopRatedMoviesCubit extends HydratedCubit<TopRatedMoviesStates> {
  TopRatedMoviesCubit(this._getTopRatedMoviesUsecase) : super(TopRatedMoviesInitialState());
  final GetMoviesListUsecase _getTopRatedMoviesUsecase;
  static TopRatedMoviesCubit get(context)=>BlocProvider.of(context);
  Future<void> getTopRatedMoviesData() async {
   if(state is!GetTopRatedMoviesSuccessState)
     {
       emit(GetTopRatedMoviesLoadingState());

       Either<Failure, List<Movie>> response = await _getTopRatedMoviesUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.movie,listType: "top_rated"));
       emit(response.fold(
               (failure) => GetTopRatedMoviesErrorState(msg: mapFailureToMsg(failure)),
               (topRatedMovies) => GetTopRatedMoviesSuccessState(topRatedMovies,DateTime.now().toIso8601String(),AppStrings.appLang)));
     }
  }
  @override
  TopRatedMoviesStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetTopRatedMoviesSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(TopRatedMoviesStates state) {
    if(state is GetTopRatedMoviesSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/get_movies_list_cubit/get_movies_list_states.dart';
class GetMoviesListCubit extends HydratedCubit<GetMoviesListStates> {
  GetMoviesListCubit(this._getMoviesListUsecase, this.listType) : super(GetMoviesListInitialState());
  final GetMoviesListUsecase _getMoviesListUsecase;
  final String listType;
  static GetMoviesListCubit get(context)=>BlocProvider.of(context);
  Future<void> getMoviesList() async {
   if(state is!GetMoviesListSuccessState)
     {
      emit(GetMoviesListLoadingState());
       Either<Failure,List<Movie>> response =await _getMoviesListUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.movie,listType: listType));
       emit(response.fold(
               (failure)=>GetMoviesListErrorState(msg: mapFailureToMsg(failure)),
               (playingMovies)=>GetMoviesListSuccessState(playingMovies,DateTime.now().toIso8601String(),AppStrings.appLang)));
     }
  }
  @override
  String get id=>listType;
  @override
  GetMoviesListStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetMoviesListSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(GetMoviesListStates state) {
    if(state is GetMoviesListSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/on_boarding/domain/usecases/get_genres_usecase.dart';
import 'package:mo3tv/features/on_boarding/domain/usecases/save_genres_usecase.dart';
part 'genres_state.dart';
class GenresCubit extends Cubit<GenresState> {
  final SaveGenresUseCase _saveGenresUseCase;
  final GetGenresUseCase _getGenresUseCase;
  GenresCubit(this._saveGenresUseCase, this._getGenresUseCase) : super(GenresInitial()){
    movieGenres=[];
    tvGenres=[];
  }
  static GenresCubit get(context)=>BlocProvider.of(context);
  late List<String> movieGenres;
  late List<String> tvGenres;
  addToList({required bool isMovie,required String genre}){
    if(isMovie)
    {
        if(movieGenres.contains(genre))
        {
          movieGenres.remove(genre);
        }
        else
        {
          if(movieGenres.length<3) {
            movieGenres.add(genre);
          }
        }
    }
    else
    {
      if(tvGenres.contains(genre))
      {
        tvGenres.remove(genre);
      }
      else
      {
        if(tvGenres.length<3) {
          tvGenres.add(genre);
        }
      }
    }
    emit(AddGenreState());
  }
  Future<void>saveList()async{
    emit(SaveGenresLoadingState());
    Either<Failure, void> response=await _saveGenresUseCase(movieGenres: movieGenres, tvGenres: tvGenres);
    emit(response.fold((l) => SaveGenresErrorState(),
            (r) => SaveGenresSuccessState()));
  }
  getGenres()async{
    emit(state);
    Either<Failure,List<String>> movies= await _getGenresUseCase(true);
    Either<Failure,List<String>> tv= await _getGenresUseCase(false);
    movies.fold((l) => emit(GetGenresErrorState()),
            (r) => movieGenres.addAll(r));
    tv.fold((l) => emit(GetGenresErrorState()),
            (r) => tvGenres.addAll(r));
    emit(GetGenresSuccessState());
  }
}
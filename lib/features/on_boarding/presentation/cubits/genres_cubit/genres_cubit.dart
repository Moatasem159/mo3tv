import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/on_boarding/domain/usecases/save_genres_usecase.dart';
part 'genres_state.dart';
class GenresCubit extends Cubit<GenresState> {
  final SaveGenresUseCase _saveGenresUseCase;
  GenresCubit(this._saveGenresUseCase) : super(GenresInitial()){
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
          movieGenres.add(genre);
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
        tvGenres.add(genre);
      }
    }
    emit(AddGenreState());
  }
  saveList()async{
    emit(SaveGenresLoadingState());
    Either<Failure, void> response=await _saveGenresUseCase.call(movieGenres: movieGenres, tvGenres: tvGenres);
    emit(response.fold((l) => SaveGenresErrorState(),
            (r) => SaveGenresSuccessState()));

  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
part 'genres_state.dart';
class GenresCubit extends Cubit<GenresState> {
  GenresCubit() : super(GenresInitial()){
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
}
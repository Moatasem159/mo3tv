part of 'genres_cubit.dart';
abstract class GenresState {}
class GenresInitial extends GenresState {}
class AddGenreState extends GenresState {}
class SaveGenresLoadingState extends GenresState {}
class SaveGenresSuccessState extends GenresState {}
class SaveGenresErrorState extends GenresState {}
class GetGenresLoadingState extends GenresState {}
class GetGenresErrorState extends GenresState {}
class GetGenresSuccessState extends GenresState {}

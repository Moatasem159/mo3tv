import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class MovieStates extends Equatable{
  @override
  List<Object?> get props => [];
}
class MoviesInitialState extends MovieStates{}
class GetMovieDetailsLoadingState extends MovieStates{}
class GetMovieDetailsSuccessState extends MovieStates{
  final Movie movie;
  GetMovieDetailsSuccessState(this.movie);
  @override
  List<Object>get props=>[movie];
}
class GetMovieDetailsErrorState extends MovieStates{
  final String msg;
  GetMovieDetailsErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}
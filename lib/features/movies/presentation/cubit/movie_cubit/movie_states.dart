import 'package:equatable/equatable.dart';
abstract class MovieStates extends Equatable{
  @override
  List<Object?> get props => [];
}
class MoviesInitialState extends MovieStates{}
class ClearObjectsState extends MovieStates{}
class GetMovieDetailsLoadingState extends MovieStates{}
class GetMovieDetailsSuccessState extends MovieStates{}
class GetMovieDetailsErrorState extends MovieStates{
  final String msg;
  GetMovieDetailsErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}

class RateMovieLoadingState extends MovieStates{}
class RateMovieSuccessState extends MovieStates{}
class RateMovieErrorState extends MovieStates{
  final String msg;
  RateMovieErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}
class RemoveRateMovieLoadingState extends MovieStates{}
class RemoveRateMovieSuccessState extends MovieStates{}
class RemoveRateMovieErrorState extends MovieStates{
  final String msg;
  RemoveRateMovieErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}
class FavMovieLoadingState extends MovieStates{}
class FavMovieSuccessState extends MovieStates{
  final int statusCode;
  FavMovieSuccessState({required this.statusCode});
}
class FavMovieErrorState extends MovieStates{
  final String msg;
  FavMovieErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}
class AddToWatchListLoadingState extends MovieStates{}
class AddToWatchListSuccessState extends MovieStates{
  final int statusCode;
  AddToWatchListSuccessState({required this.statusCode});
}
class AddToWatchListErrorState extends MovieStates{
  final String msg;
  AddToWatchListErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}
import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
abstract class GenresRepository{
  Future<Either<Failure,void>> saveGenres({required List<String> movieGenres, required List<String>tvGenres});
}
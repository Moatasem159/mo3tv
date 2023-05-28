import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
abstract class SearchRepository{
  Future<Either<Failure,List<Search>>> search({required int page,required String word,required String lang});
  Future<Either<Failure,bool>> saveSearch({required Search search});
  Future<Either<Failure,List<Search>>> getListSearch();
  Future<Either<Failure,bool>> clearListSearch();
  Future<Either<Failure,bool>> clearOneSearch({required Search search});
}
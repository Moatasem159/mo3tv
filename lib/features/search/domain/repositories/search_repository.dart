import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';

abstract class SearchRepository{
  Future<Either<Failure,List<Search>>> search({required int page,required String word});

}
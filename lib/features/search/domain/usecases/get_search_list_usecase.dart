import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class GetSearchListUsecase{
  final SearchRepository _searchRepository;
  GetSearchListUsecase(this._searchRepository);
  Future<Either<Failure,List<Search>>> call() async{
    return await _searchRepository.getListSearch();
  }
}
import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class ClearSearchListUsecase{
  final SearchRepository _searchRepository;
  const ClearSearchListUsecase(this._searchRepository);
  Future<Either<Failure,bool>> call() async{
    return await _searchRepository.clearListSearch();
  }
}
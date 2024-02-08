import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class ClearOneSearchUsecase{
  final SearchRepository _searchRepository;
  const ClearOneSearchUsecase(this._searchRepository);
  Future<Either<Failure,bool>> call({required Search search}) async=>
      await _searchRepository.clearOneSearch(search: search);
}
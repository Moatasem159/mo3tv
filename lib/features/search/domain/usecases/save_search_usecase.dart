import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class SaveSearchUsecase{
  final SearchRepository _searchRepository;
  SaveSearchUsecase(this._searchRepository);
  Future<Either<Failure,bool>> call({required Search search}) async{
    return await _searchRepository.saveSearch(search: search);
  }
}
import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';

class SearchUsecase{
  final SearchRepository searchRepository;
  SearchUsecase(this.searchRepository);
  Future<Either<Failure, List<Search>>> call({required int page,required String word}) async{
    return await searchRepository.search(page: page, word: word);
  }
}
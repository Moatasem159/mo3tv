import 'package:hive/hive.dart';
abstract class GenresLocalDataSource{
  Future<void> saveGenres({required List<String> movieGenres,required List<String> tvGenres});
  Future<List<String>> getGenres(bool isMovie);
}
class GenresLocalDataSourceImpl implements GenresLocalDataSource{
  @override
  Future<void> saveGenres({required List<String> movieGenres, required List<String>tvGenres})async {
     Box movieBox=await Hive.openBox("movieGenres");
     Box tvBox=await Hive.openBox("tvGenres");
     await movieBox.clear();
     await tvBox.clear();
     await movieBox.addAll(movieGenres);
     await tvBox.addAll(tvGenres);
     await movieBox.close();
     await tvBox.close();
  }
  @override
  Future<List<String>> getGenres(bool isMovie)async{
    String name=isMovie ? "movieGenres":"tvGenres";
    Box<String> box=await Hive.openBox(name);
    List<String> genres = box.values.toList();
    box.close();
    return genres;
  }
}
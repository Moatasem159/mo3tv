import 'package:hive/hive.dart';
abstract class GenresLocalDataSource{
  Future<void> saveGenres({required List<String> movieGenres,required List<String> tvGenres});
}
class GenresLocalDataSourceImpl implements GenresLocalDataSource{
  @override
  Future<void> saveGenres({required List<String> movieGenres, required List<String>tvGenres})async {
     Box movieBox=await Hive.openBox("movieGenres");
     Box tvBox=await Hive.openBox("tvGenres");
     movieBox.addAll(movieGenres);
     tvBox.addAll(tvGenres);
     movieBox.close();
     tvBox.close();
  }
}
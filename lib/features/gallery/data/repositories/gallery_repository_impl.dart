import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/gallery/data/datasources/gallery_datasource.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/repositories/gallery_repository.dart';
class GalleryRepositoryImpl implements GalleryRepository{
  final GalleryDataSource _galleryDataSource;
  final NetworkInfo _networkInfo;
  const GalleryRepositoryImpl(this._networkInfo,this._galleryDataSource);
  @override
  Future<Either<Failure, Gallery>> getMediaGallery(MediaParams params) async{
  return executeAndHandleError<Gallery>(() =>  _galleryDataSource.getMediaGallery(params),_networkInfo);
  }
}
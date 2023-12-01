import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/gallery/data/datasources/gallery_datasource.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/repositories/gallery_repository.dart';
class GalleryRepositoryImpl implements GalleryRepository{
  final GalleryDataSource _galleryDataSource;
  final NetworkInfo _networkInfo;
  const GalleryRepositoryImpl(this._networkInfo,this._galleryDataSource);
  @override
  Future<Either<Failure, Gallery>> getMediaGallery({required int mediaId,required String mediaType}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _galleryDataSource.getMediaGallery(mediaId: mediaId,mediaType: mediaType);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}
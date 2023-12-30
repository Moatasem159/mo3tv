import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
abstract class TvRepository{
  Future<Either<Failure,TvShow>> getTvShowDetails(MediaParams params);
  Future<Either<Failure,TvShowSeason>> getTvShowSeasonDetails(MediaParams params);
}
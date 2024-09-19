import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';

abstract class BaseRepository {
  Future<ApiResult<T>> execute<T>(Future<T> Function() function);
}

class BaseRepositoryImpl implements BaseRepository {
  final NetworkInfo _networkInfo;

  BaseRepositoryImpl(this._networkInfo);

  @override
  Future<ApiResult<T>> execute<T>(Future<T> Function() function) async {
    if ((await _networkInfo.isConnected)) {
      try {
        final T data = await function();
        return ApiSuccess(data);
      } on ServerException catch (failure) {
        return ApiFailure(ServerFailure(failure.message!));
      }
    } else {
      return const ApiFailure(ServerFailure(AppStrings.noInternetConnection));
    }
  }
}
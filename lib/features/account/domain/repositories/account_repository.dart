import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';

abstract class AccountRepository {
  Future<ApiResult<Account>> getAccountDetails({required String sessionId});

  Future<ApiResult<AccountListEntity>> getAccountList(MediaParams params);

  Future<void> getSessionId();
}
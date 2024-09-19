import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_lists_usecase.dart';

part 'account_lists_state.dart';

class AccountListsCubit extends Cubit<AccountListsStates> {
  AccountListsCubit(this._getAccountListsUsecase)
      : super(AccountListsInitialState()) {
    page = 1;
    totalPage = 0;
    totalResult = 0;
    list = [];
  }

  final GetAccountListsUsecase _getAccountListsUsecase;

  static AccountListsCubit get(context) => BlocProvider.of(context);
  late int page;
  late int totalPage;
  late int totalResult;
  late List<Media> list;

  Future<void> getAccountList(
      {required String listType, required String mediaType}) async {
    emit(GetAccountListsLoadingState(page == 1 ? true : false));
    ApiResult<AccountListEntity> result =
        await _getAccountListsUsecase(MediaParams(
      listType: listType,
      mediaType: mediaType,
      page: page,
      lang: AppStrings.appLang,
    ));
    switch (result) {
      case ApiSuccess<AccountListEntity>():
        page = result.data.page;
        totalResult = result.data.totalResults;
        totalPage = result.data.totalPages;
        list.addAll(result.data.list);
        emit(GetAccountListsSuccessState());
      case ApiFailure<AccountListEntity>():
        emit(GetAccountListsErrorState(msg: mapFailureToMsg(result.failure)));
    }
  }

  update() {
    emit(UpdateListState());
  }
}
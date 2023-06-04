import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/usecases/clear_account_custom_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_action_bloc/account_custom_list_action_event.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_action_bloc/account_custom_list_action_state.dart';
import 'package:rxdart/transformers.dart';
class AccountCustomListActionBloc extends Bloc<AccountCustomListActionEvents, AccountCustomListActionStates> {
  AccountCustomListActionBloc(this._clearAccountCustomListUseCase) : super(AccountCustomListActionInitialState()) {
    on<ClearListEvent>((event, emit) =>clearList(emit, listId: event.listId),
        transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
  }
  static AccountCustomListActionBloc get(context)=>BlocProvider.of(context);
  final ClearAccountCustomListUseCase _clearAccountCustomListUseCase;
  Future<void> clearList(emit,{required String listId})async{
    emit(ActionLoadingState());
    Either<Failure, Message> response=await _clearAccountCustomListUseCase.call(
        sessionId:AppStrings.sessionId, listId: listId);
    emit(response.fold(
        (l) =>ActionErrorState(), (r){
     return ActionSuccessState();
    }));
  }
}

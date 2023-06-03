import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/usecases/create_account_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/create_list_cubit/create_list_state.dart';
class CreateListCubit extends Cubit<CreateListStates> {
  CreateListCubit(this._createAccountListUsecase) : super(CreateListInitialState());
  static CreateListCubit get(context) => BlocProvider.of(context);
  final CreateAccountListUsecase _createAccountListUsecase;
  Future<void> createAccountList(
      {required String sessionId,
      required String title,
      required String description}) async {
    emit(CreateListLoadingState());
    Either<Failure, Message> response = await _createAccountListUsecase.call(
        sessionId: sessionId,
        body: {"name": title, "description": description});
    emit(response.fold(
        (l) => CreateListErrorState(),
        (r) => CreateListSuccessState()));
  }
}
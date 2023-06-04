import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/core/widgets/toast/custom_toast.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_lists_cubit/account_custom_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/create_list_cubit/create_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/create_list_cubit/create_list_state.dart';
class CreateButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController desController;
  const CreateButton(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.desController});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<CreateListCubit, CreateListStates>(
        listener: (context, state) {
          if (state is CreateListSuccessState) {
            GoRouter.of(context).pop();
            AccountCustomListsCubit.get(context)
                .getAccountCustomLists(sessionId: AppStrings.sessionId, accountId: AppStrings.accountId);
            CustomToast.showToast(context, msg: AppStrings.createListDialog);
          }
        },
        builder: (context, state) {
          CreateListCubit cubit = CreateListCubit.get(context);
          if (state is CreateListLoadingState) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 1,
            );
          }
          return MainButton(
            label: AppStrings.createList.tr(context)!,
            radius: 5,
            size: const Size(80, 20),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                cubit.createAccountList(
                    sessionId: AppStrings.sessionId,
                    title: nameController.text,
                    description: desController.text);
              }
              FocusScope.of(context).unfocus();
            },
          );
        },
      ),
    );
  }
}
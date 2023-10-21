import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/page_counter_widgets/page_number_list.dart';
class PageCounterWidget extends StatelessWidget {
  final String mediaType;
  final String listType;
  const PageCounterWidget({super.key, required this.mediaType, required this.listType});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountListsCubit, AccountListsStates>(
      builder: (context, state) {
        AccountListsCubit cubit = AccountListsCubit.get(context);
        if (state is GetAccountListsLoadingState) {
          return  Container();
        }
        if(cubit.totalResult>20&&cubit.totalPage>1) {
          return PageNumbersList(listType: listType, mediaType: mediaType,page: cubit.page,totalPage: cubit.totalPage,);
        }
        return 10.ph;
      },
    );
  }
}




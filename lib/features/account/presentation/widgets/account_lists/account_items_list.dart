import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
class AccountList extends StatelessWidget {
  final String mediaType;
  final String listType;
  const AccountList({super.key, required this.mediaType, required this.listType});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountListsCubit,AccountListsStates>(
      builder: (context, state) {
        AccountListsCubit cubit = AccountListsCubit.get(context);
        if(state is GetAccountListsLoadingState)
        {
          return const SliverMediaLoadingList();
        }
        if(cubit.list.isEmpty&&cubit.totalPage>1)
        {
            return const SliverToBoxAdapter();
        }
        if(cubit.list.isEmpty)
        {
          if(mediaType=="movies")
          {
            return const EmptyAccountList(type:AppStrings.noMovies);
          }
          else if(mediaType =="tv")
            {
              return const EmptyAccountList(type:AppStrings.noTvShows);
            }
        }
        if(cubit.list.isNotEmpty)
        {
          if(mediaType=="movies")
          {
            return MediaVerticalList(mediaList: cubit.list as List<Media>,listType:listType,isMovie:true);
          }
           else if(mediaType =="tv")
           {
          return MediaVerticalList(mediaList: cubit.list as List<Media>,listType:listType,isMovie: false);
        }
        }
        if(state is GetAccountListsErrorState)
        {
          return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountList(mediaType:mediaType,listType: listType)));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
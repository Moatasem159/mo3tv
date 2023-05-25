import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
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
        if(cubit.list.isEmpty&&cubit.totalResult>1)
          {
            return const SliverToBoxAdapter();
          }
        if(cubit.list.isEmpty)
        {
          if(mediaType=="movies")
          {
            return const EmptyAccountList(type:"movies");
          }
          else if(mediaType =="tv")
            {
              return const EmptyAccountList(type:"tv shows");
            }
        }
        if(cubit.list.isNotEmpty)
        {
          if(mediaType=="movies")
          {
            return MoviesList(movieList: cubit.list as List<Movie>,listType:listType);
          }
           else if(mediaType =="tv")
           {
          return TvList(tvList: cubit.list as List<TvShow>,listType:listType);
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
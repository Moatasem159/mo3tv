import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_state.dart';
import 'package:mo3tv/features/search/presentation/widgets/recently_widgets/clear_button.dart';
import 'package:mo3tv/features/search/presentation/widgets/recently_widgets/recently_search_list.dart';
class RecentlySearch extends StatelessWidget {
  const RecentlySearch({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchListCubit,SearchListStates>(builder: (context, state) {
      if (SearchListCubit.get(context).recently.isNotEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ClearButton(),
              RecentlySearchList(recently: SearchListCubit.get(context).recently)
            ],
          ),
        ) ,
      );
      }
      return const SliverToBoxAdapter();
    });
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_bloc.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_state.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:mo3tv/features/search/presentation/widgets/recently_widgets/recently_search.dart';
import 'package:mo3tv/features/search/presentation/widgets/search_bar_widget.dart';
import 'package:mo3tv/features/search/presentation/widgets/search_empty_widget.dart';
import 'package:mo3tv/features/search/presentation/widgets/search_list.dart';
import 'package:mo3tv/features/search/presentation/widgets/search_loading_widget.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchListCubit>(create: (context) => di.sl<SearchListCubit>()..getSearchList()),
        BlocProvider<SearchBloc>(create: (context) => di.sl<SearchBloc>())
      ],
      child: BlocBuilder<SearchBloc, SearchStates>(
        builder: (context, state) {
          return GestureDetector(
          onTap: () =>  FocusManager.instance.primaryFocus!.unfocus(),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                 const SearchBarWidget(),
                if(state is SearchInitialState)
                  const RecentlySearch(),
                if(state is SearchLoadingState)
                 const SearchLoadingWidget(),
                if (state is SearchSuccessEmptyState)
                 const SearchEmptyWidget(),
                if (state is SearchSuccessState)
                 SearchList(items: state.items)
              ],
            ),
          );
        },
      ),
    );
  }
}
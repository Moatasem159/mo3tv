import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/textformfield.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_bloc.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_events.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_state.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchStates>(
      builder: (context, state) {
        SearchBloc cubit = SearchBloc.get(context);
        return SliverAppBar(
          pinned: true,
          expandedHeight: 70,
          elevation: 0,
          toolbarHeight: 70,
          flexibleSpace: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                10.ph,
                MainTextFormField(
                  controller: cubit.controller,
                  hintText: AppStrings.searchDialog.tr(context)!,
                  focusedBorderColor: Colors.white,
                  prefixIcon: Icons.search,
                  onChange: (query) {
                    cubit.add(SearchEvent(query,AppLocalizations.of(context)!.getLang()));
                    if (query.isEmpty) {
                      SearchListCubit.get(context).getSearchList();
                    }
                  },
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.add(ClearEvent());
                        SearchListCubit.get(context).getSearchList();
                      },
                      child: const Icon(Icons.clear, color: Colors.white)),
                ),
                5.ph
              ],
            ),
          ),
        );
      },
    );
  }
}
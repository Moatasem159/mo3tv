import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/textformfield.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_bloc.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
part '../widgets/search_list.dart';
part '../widgets/search_bar_widget.dart';
part '../widgets/media_search_widget.dart';
part '../widgets/search_empty_widget.dart';
part '../widgets/search_loading_widget.dart';
part '../widgets/recently_widgets/clear_button.dart';
part '../widgets/recently_widgets/recently_search.dart';
part '../widgets/recently_widgets/recently_search_item.dart';
part '../widgets/recently_widgets/recently_search_list.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchListCubit>(create: (context) => SearchListCubit(di.sl(),
            di.sl(),di.sl(),di.sl())..getSearchList()),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc(di.sl()))
      ],
      child: BlocBuilder<SearchBloc, SearchStates>(
        builder: (context, state) {
          return GestureDetector(
          onTap: () =>  FocusManager.instance.primaryFocus!.unfocus(),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                 const _SearchBarWidget(),
                if(state is SearchInitialState)
                  const _RecentlySearch(),
                if(state is SearchLoadingState)
                 const _SearchLoadingWidget(),
                if (state is SearchSuccessEmptyState)
                 const _SearchEmptyWidget(),
                if (state is SearchSuccessState)
                 _SearchList(state.items)
              ],
            ),
          );
        },
      ),
    );
  }
}
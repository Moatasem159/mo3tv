import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_loading/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_loading/media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/horizontal_tv_show_list.dart';
class PopularTvShow extends StatelessWidget {
  const PopularTvShow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Popular tv shows";
    return BlocBuilder<PopularTvShowCubit,PopularTvShowStates>(
      builder:(context, state) {
        if(state is GetPopularTvShowsSuccessState)
        {
          return HorizontalTvShowList(
            tvShow:state.popularTvShow,
            title:title,
            onPressed: () {
              GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                extra: SeeMoreParameters(title: title, isMovie: false, index: 2,media: state.popularTvShow),);
            },
          );
        }
        if(state is GetPopularTvShowsLoadingState)
        {
          return const MediaLoadingList(title: title);
        }
        if(state is GetPopularTvShowsErrorState){
          return MediaErrorList(
            title: title,
            onPressed:() {
              PopularTvShowCubit.get(context).getPopularTvShowsData();
            }, );
        }
        return  Container();
      },);
  }
}
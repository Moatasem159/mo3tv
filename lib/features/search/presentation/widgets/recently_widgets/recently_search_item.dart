import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/media/data/models/media_account_details_model.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
class RecentlySearchItem extends StatelessWidget {
  final Search search;
  const RecentlySearchItem({super.key, required this.search});
  String name(Search search){
    if(search.name!='')
    {
      return "${search.name} ${search.releaseDate == "" ? '' : ((search.releaseDate.substring(0, 4)))}";
    }
    else if(search.originalName!='')
    {
      return "${search.originalName} ${search.releaseDate == "" ? '' : ((search.releaseDate.substring(0, 4)))}";
    }
    else if(search.originalTitle!='')
    {
      return "${search.originalTitle} ${search.releaseDate == "" ? '' : ((search.releaseDate.substring(0, 4)))}";
    }
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
        if(search.mediaType=="movie") {
          Movie m=Movie(
            id: search.id,
            mediaAccountDetails: MediaAccountDetails(),
            name: search.originalTitle,
            originalName: search.originalTitle,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
          );
          GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,extra:m,pathParameters:{"listType":"?"});
        }
        else if(search.mediaType=="tv"){
          TvShow tv=TvShow(
            id: search.id,
            originalName :search.originalName,
            name: search.name,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
          );
          GoRouter.of(context).pushNamed(Routes.tvShowDetailsRoute, extra: tv,pathParameters: {"listType":"?"});
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(search.mediaType=="tv")
              const Icon(Icons.tv_outlined).addPadding(t:3),
            if(search.mediaType=="movie")
              const Icon(Icons.movie_filter_rounded).addPadding(t: 3),
            10.pw,
            SizedBox(
                width: MediaQuery.of(context).size.width-89,
                child: Text(name(search),maxLines: null,
                  style: AppTextStyles.get14BoldText(),
                  overflow: TextOverflow.ellipsis,)),
            GestureDetector(
              onTap: () => SearchListCubit.get(context).clearOneSearch(search: search),
                child: const Icon(Icons.clear_rounded,size: 15))
          ],
        ),
      ),
    );
  }
}
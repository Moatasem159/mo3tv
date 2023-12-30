import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/season_poster_widgets/season_poster.dart';
class SeasonsListWidget extends StatelessWidget {
  final TvShow tvShow;
  const SeasonsListWidget({super.key, required this.tvShow});
  @override
  Widget build(BuildContext context) {
   if(tvShow.seasons.isNotEmpty)
     {
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("${AppStrings.seasons.tr(context)!}:",style: AppTextStyles.get14BoldText()).addSymmetricPadding(h: 10),
           SizedBox(
             height: MediaQuery.sizeOf(context).height/3,
             child: ListView.builder(
                 physics: const BouncingScrollPhysics(),
                 padding:  EdgeInsets.only(left: AppLocalizations.of(context)!.isEnLocale?0:10,right: AppLocalizations.of(context)!.isEnLocale?10:0),
                 itemCount: tvShow.seasons.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) => SeasonPoster(
                     season: tvShow.seasons[index],
                     tvShowId: tvShow.id,
                     tvShowName: tvShow.originalName)),
           ),
         ],
       );
     }
   return const SizedBox();
  }
}
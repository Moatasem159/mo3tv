import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/functions/pagination.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/widgets/cast_widget/cast_widget.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
class MediaCreditsList extends StatefulWidget {
  final List<CastMember> mediaCredits;
  const MediaCreditsList({super.key, required this.mediaCredits});
  @override
  State<MediaCreditsList> createState() => _MediaCreditsListState();
}
class _MediaCreditsListState extends State<MediaCreditsList> {
  int _page = 0;
  final int _perPage = 10;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${AppStrings.cast.tr(context)!} :${widget.mediaCredits
                  .length}",
                  style: AppTextStyles.get18BoldText(height: 0)).addSymmetricPadding(h: 11),
              5.ph
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.mediaCredits.length > _perPage ? pagination(
                widget.mediaCredits, _page, _perPage).length : widget
                .mediaCredits.length,
            itemBuilder: (context, index) =>
                CastMemberWidget(
                    member: widget.mediaCredits.length > _perPage ? pagination(
                        widget.mediaCredits, _page, _perPage)[index]:widget.mediaCredits[index]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5),
          ),
          10.ph,
          if(widget.mediaCredits.length>10)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_page!=0)
                MainButton(
                    size: const Size(70,20),
                    radius: 5,
                    onPressed: (){
                      setState(() {
                        _page -= 1;
                        MovieBottomNavCubit.get(context).resetList();
                      });
                    },
                    label: AppStrings.previous.tr(context)!),
              if(((_page * _perPage) + _perPage)<widget.mediaCredits.length&&_page>0)
                100.pw,
              if(((_page * _perPage) + _perPage)<widget.mediaCredits.length)
                MainButton(
                    size: const Size(20,35),
                    radius: 5,
                    onPressed: (){
                      setState(() {
                        _page += 1;
                        MovieBottomNavCubit.get(context).resetList();
                      });
                    }, label: AppStrings.next.tr(context)!),
            ],
          ),
          10.ph
        ],
      ),
    );
  }
}
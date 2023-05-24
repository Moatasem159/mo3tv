import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/logout/presentation/widgets/log_out_button.dart';
class AccountAppBarWidget extends StatelessWidget {
  final Account account;
  const AccountAppBarWidget({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        leadingWidth:60,
        toolbarHeight:60,
        titleSpacing:0,
        title:Text(account.name==""?account.username!:account.name!,style: AppTextStyles.get14NormalText()),
        leading: CachedNetworkImage(
          imageUrl: EndPoints.logoUrl(account.avatar!),
          imageBuilder: (context, imageProvider) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider)
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(account.name==""?account.username![0]:account.name![0],
                style:AppTextStyles.get25BoldText())),
            );
          },),
        actions:const[
          LogoutButton(),
        ],
    );
  }
}
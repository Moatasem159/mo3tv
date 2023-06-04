import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
class AccountCustomListItemWidget extends StatelessWidget {
  final AccountCustomMediaList item;
  const AccountCustomListItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(Routes.accountCustomListRoute,extra: item),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(FontAwesomeIcons.solidImages, size: 70, color: Colors.grey[100]!.withOpacity(0.15)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.name!, textAlign: TextAlign.center,
                    style: AppTextStyles.get18BoldText(height: 0)),
                if(item.description!='')
                Column(
                  children: [
                    10.ph,
                    Text(item.description!, textAlign: TextAlign.center,
                        style: AppTextStyles.get18BoldText(height: 0)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
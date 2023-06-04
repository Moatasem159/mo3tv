import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
class AccountCustomListItem extends StatelessWidget {
  final AccountCustomMediaList item;
  const AccountCustomListItem({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(FontAwesomeIcons.solidImages, size: 70, color: Colors.grey[100]!.withOpacity(0.15)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item.name!, style: AppTextStyles.get18BoldText(height: 0)),
              Text(item.description!, textAlign: TextAlign.center,
                  style: AppTextStyles.get18BoldText(height: 0)),
            ],
          ),
        ],
      ),
    );
  }
}
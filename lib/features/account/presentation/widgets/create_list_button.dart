import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class CreateListButton extends StatelessWidget {
  const CreateListButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>GoRouter.of(context).pushNamed(Routes.createListRoute),
      child: Text(AppStrings.createList.tr(context)!,style: AppTextStyles.get14BoldText(
          color: Theme.of(context).primaryColor,height: 0)));
  }
}
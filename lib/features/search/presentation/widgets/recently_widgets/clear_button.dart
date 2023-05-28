import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
class ClearButton extends StatelessWidget {
  const ClearButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppStrings.recent.tr(context)!,style: AppTextStyles.get14BoldText()),
        const Spacer(),
        GestureDetector(
          onTap: () =>SearchListCubit.get(context).clearSearch(),
            child:Text(AppStrings.clear.tr(context)!,style: AppTextStyles.get14NormalText(color: Theme.of(context).primaryColor))),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/widgets/create_list_screen_widgets/create_list_screen_body.dart';
class CreateListScreen extends StatelessWidget {
  const CreateListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.createNewList.tr(context)!,
            style: AppTextStyles.get18BoldText(height: 0))),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const CreateListScreenBody(),
        ),
      ),
    );
  }
}
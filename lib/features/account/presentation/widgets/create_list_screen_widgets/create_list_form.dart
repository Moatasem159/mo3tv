import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/textformfield.dart';
class CreateListForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController desController;
  final GlobalKey<FormState> formKey;
  const CreateListForm({super.key, required this.nameController, required this.desController,required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.ph,
          Text(AppStrings.listTitle.tr(context)!,
              style: AppTextStyles.get14BoldText(height: 0)).addSymmetricPadding(h: 15, v: 5),
          MainTextFormField(
            controller: nameController,
            prefixIcon: Icons.title_rounded,
            validator: (value) {
              if(value!.isEmpty)
                {
                  return AppStrings.nameError.tr(context);
                }
              return null;
            },
          ),
          10.ph,
          Text(AppStrings.description.tr(context)!,
              style: AppTextStyles.get14BoldText(height: 0)).addSymmetricPadding(h: 15, v: 5),
          MainTextFormField(
            controller: desController,
            prefixIcon: Icons.subtitles_rounded,
          ),
          15.ph,
        ],
      ),
    );
  }
}
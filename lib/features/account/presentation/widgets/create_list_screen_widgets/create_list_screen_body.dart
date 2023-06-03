import 'package:flutter/material.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/cubit/create_list_cubit/create_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/widgets/create_list_screen_widgets/create_button.dart';
import 'package:mo3tv/features/account/presentation/widgets/create_list_screen_widgets/create_list_form.dart';
class CreateListScreenBody extends StatelessWidget {
  const CreateListScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController desController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => di.sl<CreateListCubit>(),
      child: Column(
        children: [
          10.ph,
          Center(child: Text("Mo3Tv", style: AppTextStyles.get25BoldText(color: Colors.grey))),
          CreateListForm(formKey: formKey, desController: desController, nameController: nameController),
          CreateButton(formKey: formKey, nameController: nameController,desController: desController)
        ],
      ),
    );
  }
}

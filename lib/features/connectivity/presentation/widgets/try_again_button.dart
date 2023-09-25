import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_cubit.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_state.dart';
class TryAgainButton extends StatelessWidget {
  const TryAgainButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckConnectivityCubit, CheckConnectivityStates>(
      builder: (context, state) {
        if (state is CheckConnectivityLoadingState) {
          return const CircularProgressIndicator(strokeWidth: 1);
        }
        return MainButton(
            onPressed:CheckConnectivityCubit.get(context).checkAgain,
            label: AppStrings.tryAgain.tr(context)!);
      },
    );
  }
}
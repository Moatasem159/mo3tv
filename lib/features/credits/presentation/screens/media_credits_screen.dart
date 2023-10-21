import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_state.dart';
import 'package:mo3tv/features/credits/presentation/widgets/media_credits_list.dart';
import 'package:mo3tv/features/credits/presentation/widgets/media_credits_loading_list.dart';
class MediaCredits extends StatelessWidget {
  const MediaCredits({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditsCubit,CreditsStates>(
      builder: (context, state) {
        if (state is GetMediaCreditsSuccessState) {
          return MediaCreditsList(mediaCredits: state.credits);
        }
        if (state is GetMediaCreditsLoadingState) {
          return const MediaCreditsLoadingList();
        }
        if(state is GetMediaCreditsErrorState) {
            return SliverToBoxAdapter(
              child: ErrorButton(onTap: () => CreditsCubit.get(context).getMovieCredits()));
          }
        return const SliverToBoxAdapter();
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';


class TvShowGallery extends StatelessWidget {
  const TvShowGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        return SliverToBoxAdapter(
            child: BlocProvider
                .of<TvCubit>(context)
                .tvShowGalleryList[BlocProvider
                .of<TvCubit>(context)
                .index]);
      },
    );
  }
}

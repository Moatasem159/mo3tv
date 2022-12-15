import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
import 'package:mo3tv/features/login/presentation/pages/login_screen.dart';
import 'package:mo3tv/features/tv/presentation/widgets/popular_tv_shows/popular_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/top_rated_tv_shows/top_rated_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_appbar_widget.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if(AppStrings.sessionId.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: BlocConsumer<LoginCubit, LoginStates>(
                      listener: (context, state) {
                        if (state is GetTokenSuccessState) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const LoginScreen(),));
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red)
                          ),
                          child: const Text("Login to enjoy full experience"),
                          onPressed: () async {
                            if (state is SuccessState) {
                              BlocProvider.of<LoginCubit>(context)
                                  .getSessionId();
                            }
                            else {
                              BlocProvider.of<LoginCubit>(context).getToken();
                            }
                          },
                        );
                      },
                    ),
                  ),
                );
              }
              return SliverToBoxAdapter(child: Container());
            },
          ),
          const TvAppbar(),
        ];
      },
      body: Builder(
          builder: (context) {
            return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  const PopularTvShows(),
                  const TopRatedTvShows(),
                ]
            );
          }
      ),
    );
  }
}

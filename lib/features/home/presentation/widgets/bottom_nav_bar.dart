import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        BottomNavCubit cubit=BlocProvider.of<BottomNavCubit>(context);
        return Container(
          width: double.infinity,
          height: 60,
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  cubit.changeIndex(0, context);
                },
                child: Container(
                  width: 45,
                  height: 40,
                  decoration: BoxDecoration(
                      color: cubit.index == 0 ? Colors.black54 : Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        if(cubit.index == 0)
                          const BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1.1,
                              blurStyle: BlurStyle.inner,
                              color: Colors.white10
                          ),
                        if(cubit.index == 1)
                          const BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.outer,
                            color: Colors.white30,
                          ),
                      ]
                  ),
                  child: const Icon(Icons.movie_creation_outlined),
                ),
              ),
              const SizedBox(width: 80,),
              GestureDetector(
                onTap: () {
                  cubit.changeIndex(1, context);
                },
                child: Container(
                  width: 45,
                  height: 40,
                  decoration: BoxDecoration(
                      color: cubit.index == 1 ? Colors.black54 : Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        if(cubit.index == 0)
                          const BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.outer,
                            color: Colors.white30,
                          ),
                        if(cubit.index == 1)
                          const BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1.1,
                              blurStyle: BlurStyle.inner,
                              color: Colors.white10
                          )
                      ]
                  ),
                  child: const Icon(Icons.tv),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

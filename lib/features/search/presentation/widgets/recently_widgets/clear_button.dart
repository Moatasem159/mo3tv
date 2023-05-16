import 'package:flutter/material.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
class ClearButton extends StatelessWidget {
  const ClearButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SearchListCubit.get(context).clearSearch();
      },
        child: const Text("clear",style: TextStyle(color: Colors.red),));
  }
}
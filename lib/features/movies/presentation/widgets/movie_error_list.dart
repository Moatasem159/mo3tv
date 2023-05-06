import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
class MovieErrorList extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const MovieErrorList({Key? key, required this.title, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTitle(title:title),
          15.ph,
          const Text("Something went wrong"),
          7.ph,
          MainButton(onPressed:onPressed, label: "try again")
        ],
      ),
    );
  }
}
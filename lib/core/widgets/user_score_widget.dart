import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';
class UserScoreWidget extends StatelessWidget {
  final num vote;
  const UserScoreWidget({Key? key, required this.vote}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 21,
            lineWidth: 3,
            percent: vote / 10,
            center: Text(
              "${((vote) * 10).toInt() % 10000}%",
              style: const TextStyle(fontSize: 11),
            ),
            progressColor: Colors.green,
          ),
          5.pw,
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("User"),
              Text("Score"),
            ],
          )
        ],
      ),
    );
  }
}
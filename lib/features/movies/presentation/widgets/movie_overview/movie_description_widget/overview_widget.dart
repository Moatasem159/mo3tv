import 'package:flutter/widgets.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class OverViewWidget extends StatelessWidget {
  final String overview;
  const OverViewWidget({super.key,required this.overview});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.ph,
        Text(overview,
          style:
          const TextStyle(wordSpacing: 2, height: 1.4, letterSpacing: 1.1),
        ),
        10.ph,
      ],
    );
  }
}
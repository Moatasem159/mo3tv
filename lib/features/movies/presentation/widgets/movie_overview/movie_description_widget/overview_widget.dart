import 'package:flutter/widgets.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/widgets/read_more_widget.dart';
class MovieOverViewText extends StatelessWidget {
  final String overview;
  const MovieOverViewText({super.key,required this.overview});
  @override
  Widget build(BuildContext context) {
    return ReadMoreWidget(content: overview).addSymmetricPadding(h: 10,v:5);
  }
}
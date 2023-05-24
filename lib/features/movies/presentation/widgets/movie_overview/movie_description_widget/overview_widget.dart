import 'package:flutter/widgets.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class OverViewWidget extends StatelessWidget {
  final String overview;
  const OverViewWidget({super.key,required this.overview});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          10.ph,
          Text(overview,style: AppTextStyles.get14NormalText()),
          5.ph,
        ],
      ),
    );
  }
}
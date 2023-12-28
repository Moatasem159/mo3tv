import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
part 'media_name.dart';
part 'media_tagline.dart';
part 'media_status.dart';
class MediaInfo extends StatelessWidget {
  final String name;
  final String status;
  final String tagline;
  final String releaseDate;
  const MediaInfo({
    super.key,
    required this.name,
    required this.releaseDate,
    required this.tagline,
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NameWidget(title: name, releaseDate: releaseDate),
        _TaglineWidget(tagline: tagline),
        _StatusWidget(status: status),
      ],
    );
  }
}
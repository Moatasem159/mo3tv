import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const SettingsTile({super.key, required this.title,required this.icon,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
          vertical: 8, horizontal:25),
      onTap: onTap,
      title: Text(title.tr(context)!,
      style: AppTextStyles.get18BoldText()),
      trailing: Icon(icon, color: Theme.of(context).iconTheme.color),
    );
  }
}
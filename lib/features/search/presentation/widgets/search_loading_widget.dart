import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class SearchLoadingWidget extends StatelessWidget {
  const SearchLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          10.ph,
          SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 1,
            ),
          ),
        ],
      ),
    );
  }
}
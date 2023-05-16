import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          5.ph,
          const Center(
              child: Text(
                "No Results",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
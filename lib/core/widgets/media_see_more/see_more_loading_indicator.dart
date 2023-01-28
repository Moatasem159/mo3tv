import 'package:flutter/material.dart';
class SeeMoreLoadingIndicator extends StatelessWidget {
  const SeeMoreLoadingIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            SizedBox(height: 5,),
            SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
            SizedBox(height:5,),
          ],
        ),
      ),
    );
  }
}
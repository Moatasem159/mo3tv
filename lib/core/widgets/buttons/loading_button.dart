import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(45,45)),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                  )),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
          ),
          onPressed: (){}, child:const Icon(Icons.list) ),
    );
  }
}
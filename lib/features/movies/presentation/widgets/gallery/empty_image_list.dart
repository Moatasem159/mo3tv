import 'package:flutter/material.dart';

class EmptyImageList extends StatelessWidget {

  final String text;
  const EmptyImageList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15,),
        const Icon(Icons.image_not_supported_outlined,size: 100,),
        Text(text,style: const TextStyle(fontSize: 25),),
      ],
    );
  }
}

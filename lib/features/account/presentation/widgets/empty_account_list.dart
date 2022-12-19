import 'package:flutter/material.dart';

class EmptyAccountList extends StatelessWidget {
  final String title;
  const EmptyAccountList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),

      ),
      width: 400,
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: const TextStyle(
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 10,),
          const Text("0 items",style: TextStyle(
            fontWeight: FontWeight.w500
          ),),
          const SizedBox(height: 10,),
          const Text("Try add some",style: TextStyle(fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}

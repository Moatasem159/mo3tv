import 'package:flutter/material.dart';

class PersonSearchWidget extends StatelessWidget {
  final String name;
  const PersonSearchWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:20,
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      height: 70,
      child: Row(
        children:  [
          const Icon(Icons.person,size: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(height: 10,),
              Text(name,style: const TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 4,),
              const Text("in People"),
            ],
          )
        ],
      ),
    );
  }
}

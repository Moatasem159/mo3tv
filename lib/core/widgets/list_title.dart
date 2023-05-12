import 'package:flutter/material.dart';
class ListTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ListTitle({Key? key, required this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          if(onPressed!=null)
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: const Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('See More'),
                  Icon(Icons.arrow_forward_ios, size: 15)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

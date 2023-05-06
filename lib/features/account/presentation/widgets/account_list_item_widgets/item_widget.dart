import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class ItemWidget extends StatelessWidget {
  final String title;
  final List list;
  final ImageProvider imageProvider;
  const ItemWidget({super.key, required this.title, required this.list, required this.imageProvider});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0, 0.5, 0.5, 1],
        )
            .createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstATop,
      child: Container(
        margin: const EdgeInsets.all(10),
        height:200,
        width:400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Text(title,style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                  ),),
                  5.ph,
                  if(list.length>1)
                    Text("${list.length} items",style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15
                    ),),
                  if(list.length==1)
                    Text("${list.length} item",style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
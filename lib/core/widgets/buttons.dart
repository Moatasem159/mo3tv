import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_colors.dart';



class MainButton extends StatelessWidget {

  final  VoidCallback? onPressed;
  final String label;
  const MainButton({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(28.5),
          )),
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          fixedSize: MaterialStateProperty.all(const Size(150, 57))
      ),
      onPressed:onPressed,
      child: Text(label,style: Theme.of(context).textTheme.subtitle1!.copyWith(
        color: Colors.white,
        fontSize: 15,
      ),),
    );

  }
}




class MediaIconButton extends StatelessWidget {

  final Icon icon;
  final VoidCallback onTap;
  const MediaIconButton({Key? key, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(45, 45)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
        onPressed: onTap,
        child: icon);
  }
}


class MainBackButton extends StatelessWidget {
  final  VoidCallback? onPressed;

  const MainBackButton({Key? key,this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.of(context).pop();
    },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        minimumSize: MaterialStateProperty.all(const Size(34,34)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10),
        )),
        shadowColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Icon(Icons.arrow_back_ios_rounded,color:Theme.of(context).iconTheme.color,size: 14,),
    );
  }
}
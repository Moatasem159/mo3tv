import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/buttons.dart';





class NetworkErrorWidget extends StatelessWidget {

  final VoidCallback? onRetryPressed;

  const NetworkErrorWidget({Key? key, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[
          const Text(
            "SomeThing Went Wrong",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          const Icon(Icons.wifi_off_outlined,size: 100,color: Colors.grey,),
          const  SizedBox(height: 20),
          Center(child: MainButton(onPressed:onRetryPressed, label: "Reload"))
        ],
      ),
    );
  }
}
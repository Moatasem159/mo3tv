import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/network_widgets/network_widget.dart';
class NetworkListWidget extends StatelessWidget {
  final List<Network> networks;
  const NetworkListWidget({Key? key, required this.networks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(networks.isNotEmpty) {
      return Align(
      alignment: Alignment.center,
      child: Column(
        children: [

          Text("Networks",style:AppTextStyles.get14BoldText()),
          Wrap(
            alignment: WrapAlignment.center,
            children: networks.map((e)=> NetworkWidget(network: e)).toList(),
          ),
        ],
      ),
    );
    }
    return Container();
  }
}
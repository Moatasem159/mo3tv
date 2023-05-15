import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/network_widgets/network_widget.dart';
class NetworkListWidget extends StatelessWidget {
  final List<Network> networks;
  const NetworkListWidget({Key? key, required this.networks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Text("Networks",style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          alignment: WrapAlignment.center,
          children: networks.map((e)=> NetworkWidget(network: e)).toList(),
        ),
      ],
    );
  }
}
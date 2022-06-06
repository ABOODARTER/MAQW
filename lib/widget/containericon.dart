import 'package:flutter/material.dart';

import '../main.dart';
class ContainerIconright extends StatefulWidget {

final VoidCallback onpress;


  const ContainerIconright({Key? key, required this.onpress}) : super(key: key);
  @override
  State<ContainerIconright> createState() => _ContainerIconrightState();
}

class _ContainerIconrightState extends State<ContainerIconright> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: ShapeDecoration(
        color: orangee,
        shape: const CircleBorder(),
      ),
      child: IconButton(
          onPressed:  widget.onpress,
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Colors.white,
          )),
    );
  }
}

import 'package:flutter/material.dart';

import '../main.dart';

class ContainerMap extends StatefulWidget {
  final String image;
  final String namecenter;
  final String timeopen;
  final String timeclose;
  final VoidCallback onpress;

  const ContainerMap(
      {Key? key,
      required this.image,
      required this.namecenter,
      required this.timeopen,
      required this.timeclose,
      required this.onpress})
      : super(key: key);

  @override
  State<ContainerMap> createState() => _ContainerMapState();
}

class _ContainerMapState extends State<ContainerMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              widget.image,
              width: 80,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            widget.namecenter,
            style: TextStyle(
                fontSize: 17, color: bluee, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  widget.timeopen,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.timeclose,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 40,
            height: 35,
            decoration: ShapeDecoration(
              color: orangee,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
              ),
              onPressed: widget.onpress,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../main.dart';

class DropButton extends StatefulWidget {
  final String value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged onchange;

  const DropButton(
      {Key? key,
      required this.value,
      required this.hint,
      required this.items,
      required this.onchange})
      : super(key: key);

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
        height: 60,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),border: Border.all(
          color: Colors.grey,
          width: 1.5
        ),



          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: widget.value,
                          iconSize: 40,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: bluee,
                            size: 43,
                          ),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text(
                            widget.hint,
                            style: Theme.of(context).textTheme.headline1,
                          ),

                          onChanged: widget.onchange,
                          items: widget.items,

                        )))),
          ],
        ));
  }
}

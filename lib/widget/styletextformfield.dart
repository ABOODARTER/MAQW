import 'package:flutter/material.dart';

import '../main.dart';

class StyleTextFormField extends StatefulWidget {
  const StyleTextFormField({
    Key? key,
    required this.controller,
    required this.textInputAction,
    required this.formFieldValidator,
    required this.icon,
    required this.hintText,
    required this.textInputType,
    this.obscuretext = false,
  }) : super(key: key);

  @override
  State<StyleTextFormField> createState() => _StyleTextFormFieldState();
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> formFieldValidator;
  final Widget icon;
  final String hintText;
  final TextInputType textInputType;
  final bool obscuretext;
}

class _StyleTextFormFieldState extends State<StyleTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20,color: bluee),
      obscureText: widget.obscuretext,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      validator: widget.formFieldValidator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        iconColor: Colors.blue,
        prefixIcon: widget.icon,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.headline1,
        border: Theme.of(context).inputDecorationTheme.border,
      ),
      keyboardType: widget.textInputType,
    );
  }
}

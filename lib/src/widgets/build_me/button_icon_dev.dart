import 'package:flutter/material.dart';

class ButtonIconDev extends StatefulWidget {
  final Icon icon;
  final BoxDecoration? boxDecoration;

  const ButtonIconDev({Key? key, required this.icon, this.boxDecoration})
      : super(key: key);

  @override
  State<ButtonIconDev> createState() => _ButtonIconDevState();
}

class _ButtonIconDevState extends State<ButtonIconDev> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(10.00),
          decoration: widget.boxDecoration,
          child: widget.icon),
    );
  }
}

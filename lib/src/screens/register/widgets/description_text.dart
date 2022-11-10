import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.description,
    this.color,
  }) : super(key: key);

  final String description;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 16,
        color: color,
      )
    );
  }
}
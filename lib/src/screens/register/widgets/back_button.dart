import 'package:flutter/material.dart';

import '../../../common/constants/colors_constant.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close_rounded, 
        size: 32,
        color: AppColors.inActive,),
      onPressed: onPressed,
    );
  }
}
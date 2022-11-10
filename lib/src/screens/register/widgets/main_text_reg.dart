import 'package:flutter/material.dart';

import '../../../common/constants/colors_constant.dart';

class MainTextReg extends StatelessWidget {
  const MainTextReg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Регистрация',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 30
      )
    );
  }
}
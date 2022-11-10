import 'package:bord_application/src/common/constants/colors_constant.dart';
import 'package:bord_application/src/common/constants/padding_constant.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadings.primary,
      child: CupertinoButton(
        padding: AppPadings.vertical,
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          )
      ),
    );
  }
}
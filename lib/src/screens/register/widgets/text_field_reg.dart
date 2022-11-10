import 'package:bord_application/src/common/constants/padding_constant.dart';
import 'package:flutter/cupertino.dart';

class TextFieldReg extends StatelessWidget {
  const TextFieldReg({
    Key? key,
    required this.placeholder,
    required this.textInputType,
  }) : super(key: key);
  
  final String? placeholder;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadings.primary,
      child: CupertinoTextField(
        placeholder: placeholder,
        keyboardType: textInputType,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
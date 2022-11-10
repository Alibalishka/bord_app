import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../common/constants/padding_constant.dart';

class TextFieldMask extends StatelessWidget {
  const TextFieldMask({
    Key? key,
    required this.placeholder,
    required this.maskFormatter,
    required this.textInputType,
  }) : super(key: key);
  
  final String? placeholder;
  final MaskTextInputFormatter maskFormatter;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadings.primary,
      child: CupertinoTextField(
        placeholder: placeholder,
        inputFormatters: [maskFormatter],
        keyboardType: textInputType,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
import 'package:bord_application/src/common/constants/colors_constant.dart';
import 'package:bord_application/src/common/constants/padding_constant.dart';
import 'package:bord_application/src/common/widgets/primary_button.dart';
import 'package:bord_application/src/screens/lang/lang_screen.dart';
import 'package:bord_application/src/screens/register/widgets/back_button.dart';
import 'package:bord_application/src/screens/register/widgets/description_text.dart';
import 'package:bord_application/src/screens/register/widgets/gender_widget.dart';
import 'package:bord_application/src/screens/register/widgets/main_text_reg.dart';
import 'package:bord_application/src/screens/register/widgets/text_fiel_mask.dart';
import 'package:bord_application/src/screens/register/widgets/text_field_reg.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool _isCheck = false;
  late int _value = 1;

  final maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LangScreen(),
          ));
        }),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MainTextReg(),
            const SizedBox(height: 30),
            TextFieldMask(placeholder: '+7 (XXX) XXX XX X', maskFormatter: maskFormatter, textInputType: TextInputType.phone),
            const SizedBox(height: 10),
            const TextFieldReg(placeholder: 'Имя',textInputType: TextInputType.name),
            const SizedBox(height: 10),
            const TextFieldReg(placeholder: 'Фамилия', textInputType: TextInputType.name,),
            const SizedBox(height: 10),
            const TextFieldReg(placeholder: 'Почта', textInputType: TextInputType.emailAddress,),
            const SizedBox(height: 20),
            Padding(
              padding: AppPadings.primary,
              child: Row(
                children: [
                  const Text(
                    'Пол', 
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(width: 20),
                  GenderWidget(
                    gender: 'Мужской', 
                    value: 1, 
                    groupValue: _value,
                    onChanged: (int? value){
                      setState(() {
                        _value = value!;
                      });
                    }
                  ),
                  const SizedBox(width: 10),
                  GenderWidget(
                    gender: 'Женский', 
                    value: 2, 
                    groupValue: _value,
                    onChanged: (int? value){
                      setState(() {
                        _value = value!;
                      });
                    }
                  ),
                  const SizedBox(width: 10),
                  // GenderWidget(gender: 'Женский'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TextFieldReg(placeholder: 'Код друга (не обязательно)', textInputType: TextInputType.multiline,),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: _isCheck,
              title: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Я ознакомлен с'),
                    TextSpan(
                      text: ' Пользовательским соглашением',
                      style: TextStyle(
                        color: Color(0xff3175ED),
                      ),  
                    ),
                  ]
                )
              ),
              activeColor: AppColors.primary,
              controlAffinity: ListTileControlAffinity.leading, 
              onChanged: (value){
                setState(() {
                  _isCheck = value!;
                });
              }
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Дальше', 
              onPressed: (){}
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                DescriptionText(description: 'У меня уже есть аккаунт'),
                SizedBox(width: 10),
                DescriptionText(description: 'Войти', color: AppColors.primary),
              ],
            ),
          ],
        ) 
      ),
    );
  }
}
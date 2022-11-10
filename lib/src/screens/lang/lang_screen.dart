import 'package:bord_application/src/common/constants/colors_constant.dart';
import 'package:bord_application/src/common/constants/padding_constant.dart';
import 'package:bord_application/src/screens/lang/widgets/cupertino_radio_button.dart';
import 'package:bord_application/src/screens/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/widgets/primary_button.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  late int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            SvgPicture.asset('assets/images/BORD.svg'),
            const SizedBox(height: 70),
            Padding(
              padding: AppPadings.horizontal,
              child: CupertinoRadioButton(
                value: 1, 
                description: 'Русский язык',
                groupValue: _value, 
                onChanged: (int? value){
                  setState(() {
                    _value = value!;
                  });
                }
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: AppPadings.horizontal,
              child: CupertinoRadioButton(
                value: 2, 
                groupValue: _value, 
                description: 'Қазақ тілі',
                onChanged: (int? value){
                  setState(() {
                    _value = value!;
                  });
                }
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: AppPadings.horizontal,
              child: CupertinoRadioButton(
                value: 3, 
                groupValue: _value, 
                description: 'English',
                onChanged: (int? value){
                  setState(() {
                    _value = value!;
                  });
                }
              ),
            ),
            const Spacer(),
            const Spacer(),
            PrimaryButton(text: 'Регистрация', onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const RegisterScreen(),
              ));
            },),
            const SizedBox(height: 17),
            PrimaryButton(
              text: 'Войти как гость', 
              onPressed: (){
                showModalBottomSheet(
                  isDismissible: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  context: context, 
                  builder: (context){
                    return Padding(
                      padding: AppPadings.primary,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: const Icon(Icons.close_rounded, color: AppColors.black, size: 28,)
                              ),
                              const Text(
                                'Ваш город',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                )
                              ),
                              const Text(
                                'Готово',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          CupertinoSearchTextField(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            placeholder: ' Поиск по городам',
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.inActive),
                            )
                          ),

                          // ListGrouped by alphabet 
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ) 
      ) 
    );
  }
}


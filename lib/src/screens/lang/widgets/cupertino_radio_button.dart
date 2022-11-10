import 'package:bord_application/src/common/constants/colors_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CupertinoRadioButton extends StatefulWidget {
  final int value;
  final int groupValue;
  final Color? color;
  final Color? selectColor;
  final String? description;
  void Function(int)? onChanged;

  CupertinoRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    this.color = AppColors.white,
    this.selectColor = AppColors.primary,
    required this.onChanged, 
    required this.description,
    }) : super(key: key);

  @override
  State<CupertinoRadioButton> createState() => _CupertinoRadioButtonState();
}

class _CupertinoRadioButtonState extends State<CupertinoRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        bool selected = widget.value != widget.groupValue;
        if(selected){
          widget.onChanged!(widget.value);
        }
      },
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: widget.value == widget.groupValue
                    ? widget.selectColor //active color
                    : widget.color,   //in active color
              shape: BoxShape.circle,
              border: Border.all(color: widget.value == widget.groupValue ? Colors.transparent : AppColors.inActive),
            ),
            child: const Center(
              child: Icon(
                size: 16,
                CupertinoIcons.checkmark_alt,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.description.toString(),
            style: const TextStyle(
              fontSize: 18
            ),  
          ),
        ],
      ),
    );
  }
}
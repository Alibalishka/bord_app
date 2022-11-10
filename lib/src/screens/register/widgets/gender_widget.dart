import 'package:flutter/material.dart';

import '../../../common/constants/colors_constant.dart';

// ignore: must_be_immutable
class GenderWidget extends StatefulWidget {
  
  final String gender;
  final int value;
  final int groupValue;
  final Color? color;
  final Color? selectColor;
  void Function(int)? onChanged;

  GenderWidget({
    Key? key,
    required this.gender, 
    required this.value, 
    required this.groupValue, 
    required this.onChanged,
    this.color = AppColors.white, 
    this.selectColor = AppColors.primary,
  }) : super(key: key);


  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        bool selected = widget.value != widget.groupValue;
        if(selected){
          widget.onChanged!(widget.value);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.value == widget.groupValue
                ? widget.selectColor
                : widget.color,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: widget.value == widget.groupValue ? Colors.transparent : AppColors.inActive),
        ),
        child: Text(
          widget.gender,
          style: TextStyle(
            color: widget.value == widget.groupValue ? AppColors.white : AppColors.black,
            fontSize: 16,
          ),  
        ),
      ),
    );
  }
}
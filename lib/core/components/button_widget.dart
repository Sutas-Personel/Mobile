import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'package:SutasPersonel/core/extension/context_entension.dart';

import '../constants/colors.dart';
import '../constants/font_size_const.dart';

typedef void ButtonCallback();

class ButtonWidget extends StatelessWidget {
  String buttonTitle;
  final ButtonCallback onTap;
  ButtonWidget(
    this.buttonTitle,
    this.onTap,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: AllColors.INPUT_WHITE,
        onPressed: onTap,
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: AllColors.MAIN_GREEN,
              fontWeight: FontWeight.w600,
              fontSize: FontSizeConst.SIXTEEN_PIXEL),
        ),
      ),
    );
  }
}

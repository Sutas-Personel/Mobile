import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/font_size_const.dart';
import '../extension/context_entension.dart';

class ButtonWidget extends StatelessWidget {
  String buttonTitle;
  Function onPress;

  ButtonWidget(this.buttonTitle, this.onPress);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: AllColors.INPUT_WHITE,
        onPressed: onPress,
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

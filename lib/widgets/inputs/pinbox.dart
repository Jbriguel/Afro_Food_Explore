import 'package:flutter/material.dart';

InputDecoration inputFormat(Color fillColor) {
  return InputDecoration(
    hintText: "0",
    fillColor: fillColor,
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 0.0, color: fillColor)),
    contentPadding: const EdgeInsets.symmetric(vertical: 7.0),
  );
}

TextStyle textStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

Container pinBox(
    double width,
    TextEditingController con,
    FocusNode focusNode,
    FocusNode nextFocusNode,
    Color boxColor,
    Color textColor,
    BuildContext context,
    bool show) {
  return Container(
    color: Colors.transparent,
    margin: const EdgeInsets.all(3.0),
    width: width,
    height: width,
    alignment: Alignment.center,
    child: Center(
      child: TextFormField(
        decoration: inputFormat(boxColor),
        controller: con,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: boxColor,
        maxLines: 1,
        onChanged: (text) {
          if (text.length > 1) {
            con.text = text.substring(text.length - 1);
          }
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        obscureText: false,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        autofocus: false,
        style: textStyle(width * 0.6, textColor, FontWeight.bold),
      ),
    ),
  );
}

List<Widget> pinBoxs(double width, List<TextEditingController> cons,
    Color boxColor, Color textColor, BuildContext context, bool show) {
  List<Widget> boxs = [];
  List<FocusNode> focusNodes = [];
  focusNodes.add(FocusNode());
  for (int i = 0; i < cons.length; i++) {
    focusNodes.add(FocusNode());
    if (i == cons.length - 1) {
      //focusNodes[i + 1] = null ;
    }
    boxs.add(pinBox(width, cons[i], focusNodes[i], focusNodes[i + 1], boxColor,
        textColor, context, show));
  }
  return boxs;
}

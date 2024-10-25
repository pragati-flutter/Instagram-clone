import 'package:flutter/material.dart';
class FallowButton extends StatelessWidget {
  final Function() ? function;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const FallowButton({super.key, required this.function, required this.backgroundColor, required this.borderColor, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: function,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration:  BoxDecoration(
           color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),



          ),
          alignment: Alignment.center,

          child: Text(
            text,  style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),

          ),
          width: 224,
          height: 27,
          )

        );


  }
}

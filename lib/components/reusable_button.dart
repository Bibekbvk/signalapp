import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({required this.label,this.onPress, this.buttonColor});
  final String label;
  final VoidCallback? onPress;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      child: SizedBox(
        height: 50,
        child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
              backgroundColor: buttonColor ?? Color(0xFF8ab4f8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          child: Text(label, style: TextStyle(color: Colors.white,fontSize: 16)),
        ),
      ),
    );
  }
}
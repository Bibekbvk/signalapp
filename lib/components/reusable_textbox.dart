import 'package:flutter/material.dart';


class ReusableTextBox extends StatelessWidget {

  ReusableTextBox({required this.label, this.isObscured, this.validator,this.controller,this.inputType});
  final String label;
  final bool? isObscured;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 20.0,
        shadowColor: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: inputType,
            controller: controller,
            obscureText: isObscured ?? false,
            validator: validator,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color:Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
        ),

    ));
  }
}
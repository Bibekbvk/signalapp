import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  LargeText({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  SmallText({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class LargeTextBlack extends StatelessWidget {
  LargeTextBlack({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

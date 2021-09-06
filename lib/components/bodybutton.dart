import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyButton extends StatelessWidget {
  const BodyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        onPressed: () {},
        child: Icon(
          FontAwesomeIcons.cartPlus,
          color: Colors.white,
        ),
        fillColor: Colors.black,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          height: 60.0,
          width: 60.0,
        ),
      ),
    );
  }
}
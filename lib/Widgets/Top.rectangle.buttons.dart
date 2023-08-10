import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text ('Blue'),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        minimumSize: Size(50, 50),
      ),
      onPressed: (){

      },
    );
  }
}

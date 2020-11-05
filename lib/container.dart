import 'package:flutter/material.dart';

class InputsContainer extends StatelessWidget {
  InputsContainer(this.clr, this.cardchild);
  final Widget cardchild;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: clr,
      ),
      margin: EdgeInsets.all(5),
    );
  }
}

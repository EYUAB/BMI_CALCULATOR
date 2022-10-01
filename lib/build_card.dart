import 'package:flutter/material.dart';
class BuildCard extends StatelessWidget {
  BuildCard({required this.colour, required this.childCard});
  final Widget childCard;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin:  EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colour,
      ) ,
    );
  }
}
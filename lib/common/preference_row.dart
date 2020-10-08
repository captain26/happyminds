import 'package:flutter/material.dart';

class PreferenceRow extends StatelessWidget {
  final String label;
  final Color color;
  final Color backColor;
  PreferenceRow({this.label, this.color, this.backColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          label,
        ),
      ),
    );
  }
}

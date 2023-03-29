import 'package:flutter/material.dart';

class elivettedButtonWidget extends StatelessWidget {
  const elivettedButtonWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
    );
  }
}

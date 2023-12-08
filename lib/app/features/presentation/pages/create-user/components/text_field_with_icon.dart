import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final TextEditingController? controller;
  const TextFieldWithIcon({super.key, this.label, this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
        ),
      ),
    );
  }
}

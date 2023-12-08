import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  final String? label;
  final String? title;
  final IconData? icon;

  const CardDetail({super.key, this.label, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        title: Text(label ?? ""),
        subtitle: Text(title ?? ""),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget {
  final String? fullName;
  final IconData? icon;
  const HeaderDetail({super.key, this.fullName, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          const Icon(
            Icons.person,
            size: 100,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            fullName ?? "",
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onTap;
  const LoginButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

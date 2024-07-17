import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            'Log Out',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

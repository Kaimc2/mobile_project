import 'package:easy_localization/easy_localization.dart';
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
          child: Text(
            tr('button.log_out'),
            style: const TextStyle(
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

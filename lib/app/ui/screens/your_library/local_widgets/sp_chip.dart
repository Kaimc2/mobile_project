import 'package:flutter/material.dart';

class SpChip extends StatelessWidget {
  const SpChip({
    super.key,
    required this.label,
    required this.backgroundColor,
  });

  final String label;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      side: const BorderSide(style: BorderStyle.none),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
    );
  }
}

import 'package:flutter/material.dart';

SnackBar errorSnackbar(String message) => SnackBar(
  content: Text(message),
  backgroundColor: Colors.red,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  ),
  duration: const Duration(
    seconds: 5
  ),
  behavior: SnackBarBehavior.floating,
);
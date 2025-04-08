import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

bool isObscureText = true;

toast(BuildContext context, ToastificationType type, String text) {
  toastification.show(
    context: context,
    title: Text(text),
    autoCloseDuration: const Duration(seconds: 3),
    type: type,
    style: ToastificationStyle.flatColored,
  );
}

import 'package:flutter/material.dart';

void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
  ));
}

Widget buildLoadingWidget() {
  return const Center(
      child: SizedBox(
    height: 30,
    width: 30,
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        backgroundColor: Color(0xFFBBCC6E),
      ),
    ),
  ));
}

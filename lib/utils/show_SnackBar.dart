import 'package:flutter/material.dart';

showSnack(context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.blue,
    content: Text(title)
    ),
    );
}

displaySnack(context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor:  Colors.red,
    content: Text(title)));
}

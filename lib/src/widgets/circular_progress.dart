import 'package:flutter/material.dart';

Center circularProgress() {
  return Center(
    child: CircularProgressIndicator(
      strokeWidth: 1.5,
      color: Colors.grey,
    ),
  );
}

Center circularProgressText() {
  return Center(
    child: Text(
      "Loading",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

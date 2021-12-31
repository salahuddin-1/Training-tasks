import 'package:flutter/material.dart';

class PayloadScreen extends StatefulWidget {
  final String payload;
  const PayloadScreen({Key? key, required this.payload}) : super(key: key);

  @override
  _PayloadScreenState createState() => _PayloadScreenState();
}

class _PayloadScreenState extends State<PayloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.payload),
      ),
    );
  }
}

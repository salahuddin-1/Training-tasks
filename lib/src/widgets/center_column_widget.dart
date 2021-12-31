import 'package:flutter/material.dart';

class CenterColumn extends StatelessWidget {
  final List<Widget> children;

  const CenterColumn({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}

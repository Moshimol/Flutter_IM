import 'package:flutter/material.dart';

class DisPage extends StatefulWidget {
  const DisPage({Key? key}) : super(key: key);

  @override
  State<DisPage> createState() => _DisPageState();
}

class _DisPageState extends State<DisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("办公"),
      )
    );
  }
}

import 'package:flutter/material.dart';

class ContaCtPage extends StatefulWidget {
  const ContaCtPage({Key? key}) : super(key: key);

  @override
  State<ContaCtPage> createState() => _ContaCtPageState();
}

class _ContaCtPageState extends State<ContaCtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("通讯录"),
        )
    );
  }
}

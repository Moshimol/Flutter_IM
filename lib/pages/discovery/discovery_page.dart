import 'package:flutter/material.dart';

import '../../widgets/appbar/main_appbar.dart';

class DisPage extends StatefulWidget {
  const DisPage({Key? key}) : super(key: key);

  @override
  State<DisPage> createState() => _DisPageState();
}

class _DisPageState extends State<DisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          titleName: "办公",
          onClickTap: () {
            print("办公");
          })
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_im/widgets/appbar/back_appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/module_model/contact/contact_data.dart';
class ContactUserPage extends StatefulWidget {
  const ContactUserPage({Key? key}) : super(key: key);

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class _ContactUserPageState extends State<ContactUserPage> {
  String? name = Get.parameters['chat_id'];
  ContactData? singleData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleData = Get.parameters['data']! as ContactData?;

    print(singleData!.name!);
    print(singleData!.accountId!);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: name!,
      ),
    );
  }
}

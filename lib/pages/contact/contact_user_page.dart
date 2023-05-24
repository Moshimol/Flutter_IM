import 'dart:convert';

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
  String? chatId;

  ContactData? useData;

  @override
  void initState() {
    super.initState();
    // singleData = Get.arguments!;
    chatId = Get.parameters['chat_id'];
    useData = ContactData.fromJson(Get.arguments['user_data']!);

    if (mounted) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: useData!.name!,
      ),
    );
  }
}

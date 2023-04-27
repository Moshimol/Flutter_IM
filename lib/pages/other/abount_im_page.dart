import 'package:flutter/material.dart';
import '../../widgets/appbar/back_appbar.dart';

class AboutImPage extends StatefulWidget {
  const AboutImPage({Key? key}) : super(key: key);

  @override
  State<AboutImPage> createState() => _AboutImPageState();
}

class _AboutImPageState extends State<AboutImPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackBar(
        titleName: "关于IM",
    ),
    body: Container(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Image.asset("assets/images/app_logo.png",width: 80,height: 80,),
          SizedBox(height: 30,),
          Text("即时通信",style: TextStyle(fontSize: 22,color: Color(0xff333333),fontWeight: FontWeight.w100),),
          Text("Version 1.0.0",style: TextStyle(fontSize: 16,color: Color(0xff666666)),),
          Expanded(child: Text("")),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [

              Text("《通信许可服务协议》",style: TextStyle(fontSize: 12,color: Color(0xffFF576B95))),
              Text("和"),
              Text("《通信隐私》",style: TextStyle(fontSize: 12,color: Color(0xffFF576B95))),
            ],
          ),
          SizedBox(height: 40,)

        ],
      ),
    ),);
  }
}

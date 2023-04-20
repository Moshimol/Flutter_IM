
import '../../request/config.dart';
import '../../request/request/request.dart';

class MessageManager {

  static Future<dynamic> getMessageList() async {
    var res =  await Request().post(Message.MessageList);
    return res;
  }
}
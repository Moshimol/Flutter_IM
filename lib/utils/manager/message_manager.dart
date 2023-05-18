import 'dart:ffi';

import '../../request/config.dart';
import '../../request/request/request.dart';

enum ChatType{
  ChatUserType,
  ChatGroupType,
}

class MessageManager {
  static Future<dynamic> getMessageList() async {
    var res = await Request().post(Message.MessageList);
    return res;
  }

  /// 请求消息列表
  static Future<dynamic> getMessageBySessionList({
    required ChatType chatType,
    required int lastMsgId,
    required String page,
    required bool perPage,
    required String to,
  }) async {
    var res = await Request().post(Message.MessageSingleList, data: {
      "chat_type": chatType == ChatType.ChatUserType ? 1 : 2,
      "last_msg_id": lastMsgId,
      "page": page,
      "per_page": perPage ? 21 : 20,
      "to": to,
    });
    return res;
  }
}

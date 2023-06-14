import '../../request/config.dart';
import '../../request/request/request.dart';

/// 朋友圈相关接口请求
class MomentManager {

  /// 获取个人相关信息的列表
  static Future<dynamic> getFriendCirclePrompt() async {
    var res = await Request().post(Moment.FriendPrompt);
    return res;
  }

  /// 获取朋友圈的时间戳列表
  static Future<dynamic> getFriendList({required String requestId}) async {
    var res = await Request().post(Moment.FriendList);
    return res;
  }

  /// 获取朋友圈显示关于自己的信息

  static Future<dynamic> cleanMomentNotice({required String requestId}) async {
    var res = await Request().post(Moment.FriendClean);
    return res;
  }

}
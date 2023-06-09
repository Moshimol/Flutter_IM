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

  /// 获取朋友圈显示关于自己朋友圈被点赞等相关信息
  static Future<dynamic> cleanMomentNotice({required String requestId}) async {
    var res = await Request().post(Moment.FriendClean);
    return res;
  }

  /// 点赞某一个朋友圈
  static Future<dynamic> priseMoment({required String circleID, required bool isLike}) async {
    var res = await Request().post(Moment.FriendMomentMod,data: {"friend_circle_id":circleID,"like": isLike ?  1 : 0});
    return res;
  }

}
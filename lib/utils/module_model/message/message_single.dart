/// is_external : "0"
/// msg : "{\"type\":\"file\",\"file_name\":\"2023\\u5e743\\u670810\\u53f7 \\u6668\\u4f1a\\u8bb0\\u5f55.pdf\",\"url\":\"0a5134a0bee511ed87a2375833513bf3\",\"size\":\"797789\",\"expand\":{\"extra_info\":\"{\\\"scs\\\":{\\\"msg_type\\\":1,\\\"msg_question\\\":{\\\"question\\\":\\\"\\\",\\\"question_type\\\":5},\\\"account_id\\\":\\\"764b2f18c76544d591ecea4117098ee6\\\",\\\"chat_id\\\":\\\"d98815d1m1y00de831280ec12108018ok2ug27yo\\\",\\\"entrance_id\\\":\\\"\\\"}}\"}}"
/// created : "1678412645"
/// top : "1"
/// top_time : "2023-03-10 09:44:05"
/// disturb : "0"
/// remind : "0"
/// created_at : "2022-09-07 14:06:12"
/// retract : "0"
/// chat_type : 2
/// group_info : {"appkey":"8e226bed7b5647acbfd37038118e968c","channel":"6","gid":"d98815d1m1y00de831280ec3a95c4a5e","name":"调试","avatar":""}
/// unread_num : "0"
/// nickname : "王霞"
/// sender_chat_id : "d98815d1m1y00de831280ec12108018ok2ug27yo"
/// top_timestamp : "1678412645"
/// im_msg_id : "2737"

class MessageSingle {
  MessageSingle({
      String? isExternal, 
      String? msg, 
      String? created, 
      String? top, 
      String? topTime, 
      String? disturb, 
      String? remind, 
      String? createdAt, 
      String? retract, 
      num? chatType, 
      GroupInfo? groupInfo,
      UserInfo ? userInfo,
      String? unreadNum, 
      String? nickname, 
      String? senderChatId, 
      String? topTimestamp, 
      String? imMsgId,}){
    _isExternal = isExternal;
    _msg = msg;
    _created = created;
    _top = top;
    _topTime = topTime;
    _disturb = disturb;
    _remind = remind;
    _createdAt = createdAt;
    _retract = retract;
    _chatType = chatType;
    _groupInfo = groupInfo;
    _userInfo = userInfo;
    _unreadNum = unreadNum;
    _nickname = nickname;
    _senderChatId = senderChatId;
    _topTimestamp = topTimestamp;
    _imMsgId = imMsgId;
}

  MessageSingle.fromJson(dynamic json) {
    _isExternal = json['is_external'];
    _msg = json['msg'];
    _created = json['created'];
    _top = json['top'];
    _topTime = json['top_time'];
    _disturb = json['disturb'];
    _remind = json['remind'];
    _createdAt = json['created_at'];
    _retract = json['retract'];
    _chatType = json['chat_type'];
    _groupInfo = json['group_info'] != null ? GroupInfo.fromJson(json['group_info']) : null;
    _userInfo = json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
    _unreadNum = json['unread_num'];
    _nickname = json['nickname'];
    _senderChatId = json['sender_chat_id'];
    _topTimestamp = json['top_timestamp'];
    _imMsgId = json['im_msg_id'];
  }
  String? _isExternal;
  String? _msg;
  String? _created;
  String? _top;
  String? _topTime;
  String? _disturb;
  String? _remind;
  String? _createdAt;
  String? _retract;
  num? _chatType;
  GroupInfo? _groupInfo;
  UserInfo ? _userInfo;
  String? _unreadNum;
  String? _nickname;
  String? _senderChatId;
  String? _topTimestamp;
  String? _imMsgId;
MessageSingle copyWith({  String? isExternal,
  String? msg,
  String? created,
  String? top,
  String? topTime,
  String? disturb,
  String? remind,
  String? createdAt,
  String? retract,
  num? chatType,
  GroupInfo? groupInfo,
  UserInfo ? userInfo,
  String? unreadNum,
  String? nickname,
  String? senderChatId,
  String? topTimestamp,
  String? imMsgId,
}) => MessageSingle(  isExternal: isExternal ?? _isExternal,
  msg: msg ?? _msg,
  created: created ?? _created,
  top: top ?? _top,
  topTime: topTime ?? _topTime,
  disturb: disturb ?? _disturb,
  remind: remind ?? _remind,
  createdAt: createdAt ?? _createdAt,
  retract: retract ?? _retract,
  chatType: chatType ?? _chatType,
  groupInfo: groupInfo ?? _groupInfo,
  userInfo: userInfo ?? _userInfo,
  unreadNum: unreadNum ?? _unreadNum,
  nickname: nickname ?? _nickname,
  senderChatId: senderChatId ?? _senderChatId,
  topTimestamp: topTimestamp ?? _topTimestamp,
  imMsgId: imMsgId ?? _imMsgId,
);
  String? get isExternal => _isExternal;
  String? get msg => _msg;
  String? get created => _created;
  String? get top => _top;
  String? get topTime => _topTime;
  String? get disturb => _disturb;
  String? get remind => _remind;
  String? get createdAt => _createdAt;
  String? get retract => _retract;
  num? get chatType => _chatType;
  GroupInfo? get groupInfo => _groupInfo;
  UserInfo? get userInfo => _userInfo;
  String? get unreadNum => _unreadNum;
  String? get nickname => _nickname;
  String? get senderChatId => _senderChatId;
  String? get topTimestamp => _topTimestamp;
  String? get imMsgId => _imMsgId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_external'] = _isExternal;
    map['msg'] = _msg;
    map['created'] = _created;
    map['top'] = _top;
    map['top_time'] = _topTime;
    map['disturb'] = _disturb;
    map['remind'] = _remind;
    map['created_at'] = _createdAt;
    map['retract'] = _retract;
    map['chat_type'] = _chatType;
    if (_groupInfo != null) {
      map['group_info'] = _groupInfo?.toJson();
    }
    if (_userInfo != null) {
      map['user_info'] = _userInfo?.toJson();
    }
    map['unread_num'] = _unreadNum;
    map['nickname'] = _nickname;
    map['sender_chat_id'] = _senderChatId;
    map['top_timestamp'] = _topTimestamp;
    map['im_msg_id'] = _imMsgId;
    return map;
  }

}

/// appkey : "8e226bed7b5647acbfd37038118e968c"
/// channel : "6"
/// gid : "d98815d1m1y00de831280ec3a95c4a5e"
/// name : "调试"
/// avatar : ""

class GroupInfo {
  GroupInfo({
      String? appkey, 
      String? channel, 
      String? gid, 
      String? name, 
      String? avatar,}){
    _appkey = appkey;
    _channel = channel;
    _gid = gid;
    _name = name;
    _avatar = avatar;
}

  GroupInfo.fromJson(dynamic json) {
    _appkey = json['appkey'];
    _channel = json['channel'];
    _gid = json['gid'];
    _name = json['name'];
    _avatar = json['avatar'];
  }
  String? _appkey;
  String? _channel;
  String? _gid;
  String? _name;
  String? _avatar;
GroupInfo copyWith({  String? appkey,
  String? channel,
  String? gid,
  String? name,
  String? avatar,
}) => GroupInfo(  appkey: appkey ?? _appkey,
  channel: channel ?? _channel,
  gid: gid ?? _gid,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
);
  String? get appkey => _appkey;
  String? get channel => _channel;
  String? get gid => _gid;
  String? get name => _name;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appkey'] = _appkey;
    map['channel'] = _channel;
    map['gid'] = _gid;
    map['name'] = _name;
    map['avatar'] = _avatar;
    return map;
  }

}

/// appkey : "8e226bed7b5647acbfd37038118e968c"
/// channel : "32"
/// sub_org_key : "57d078fa2b5648e8ad2f65dd5a4dc54b"
/// sub_org_name : "GUI"
/// account_id : "055f550860ed13bb0ebf8cd0c74c20f8"
/// chat_id : "d98815d1qao00t6930053d41220509523yoeacpj"
/// nickname : "黄凌霄"
/// avatar : "https://s2-cdn.oneitfarm.com/FnclIh4L_-YxxVHDLe-_eAyICD2E"
/// type : "1"
class UserInfo {
  UserInfo({
    String? appkey,
    String? channel,
    String? subOrgKey,
    String? subOrgName,
    String? accountId,
    String? chatId,
    String? nickname,
    String? avatar,
    String? type,}){
    _appkey = appkey;
    _channel = channel;
    _subOrgKey = subOrgKey;
    _subOrgName = subOrgName;
    _accountId = accountId;
    _chatId = chatId;
    _nickname = nickname;
    _avatar = avatar;
    _type = type;
  }

  UserInfo.fromJson(dynamic json) {
    _appkey = json['appkey'];
    _channel = json['channel'];
    _subOrgKey = json['sub_org_key'];
    _subOrgName = json['sub_org_name'];
    _accountId = json['account_id'];
    _chatId = json['chat_id'];
    _nickname = json['nickname'];
    _avatar = json['avatar'];
    _type = json['type'];
  }
  String? _appkey;
  String? _channel;
  String? _subOrgKey;
  String? _subOrgName;
  String? _accountId;
  String? _chatId;
  String? _nickname;
  String? _avatar;
  String? _type;
  UserInfo copyWith({  String? appkey,
    String? channel,
    String? subOrgKey,
    String? subOrgName,
    String? accountId,
    String? chatId,
    String? nickname,
    String? avatar,
    String? type,
  }) => UserInfo(  appkey: appkey ?? _appkey,
    channel: channel ?? _channel,
    subOrgKey: subOrgKey ?? _subOrgKey,
    subOrgName: subOrgName ?? _subOrgName,
    accountId: accountId ?? _accountId,
    chatId: chatId ?? _chatId,
    nickname: nickname ?? _nickname,
    avatar: avatar ?? _avatar,
    type: type ?? _type,
  );
  String? get appkey => _appkey;
  String? get channel => _channel;
  String? get subOrgKey => _subOrgKey;
  String? get subOrgName => _subOrgName;
  String? get accountId => _accountId;
  String? get chatId => _chatId;
  String? get nickname => _nickname;
  String? get avatar => _avatar;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appkey'] = _appkey;
    map['channel'] = _channel;
    map['sub_org_key'] = _subOrgKey;
    map['sub_org_name'] = _subOrgName;
    map['account_id'] = _accountId;
    map['chat_id'] = _chatId;
    map['nickname'] = _nickname;
    map['avatar'] = _avatar;
    map['type'] = _type;
    return map;
  }

}
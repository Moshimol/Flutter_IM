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
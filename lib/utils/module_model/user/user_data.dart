/// appkey : "8e226bed7b5647acbfd37038118e968c"
/// channel : "32"
/// curr_appkey : "topowghlj681uah5vcvqksmfxylc1l7h"
/// curr_channel : "40"
/// account_id : "sal27i445a4dc54b210219eaeqa5ac4r"
/// name : "卢仕彤"
/// nickname : "lushitong"
/// avatar : "https://s2-cdn.oneitfarm.com/Frl50ol-ENBZc8UuTTuUiMcXJ06f"
/// email : ""
/// gender : ""
/// phone : ""
/// sub_org_key : "57d078fa2b5648e8ad2f65dd5a4dc54b"
/// sub_org_name : "GUI"
/// app_type : "carrot_im"
/// sys_msg_unread_num : "0"
/// chat_id : "d98815d1qao00t6930053d4121080194zzvnd2n6"
/// personal_account : "d98815d1qao00t6930053d4121080194zzvnd2n6"
/// personal_account_update : "0"
/// birth : "0000-00-00"
/// province_code : "0"
/// verify : "1"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.W3siYXBwa2V5IjoidG9wb3dnaGxqNjgxdWFoNXZjdnFrc21meHlsYzFsN2giLCJjaGFubmVsIjoiNDAiLCJhY2NvdW50X2lkIjoic2FsMjdpNDQ1YTRkYzU0YjIxMDIxOWVhZXFhNWFjNHIiLCJpYXQiOjE2ODE5Nzg4MTQsImV4cCI6MTY4MzMwMjM5OSwibmJmIjoxNjgxOTc4ODE0LCJzdWIiOiJ3d3cuYWRtaW4uY29tIiwianRpIjoiYTAyYjFkYTc1NjEwODI2MDY1OTFlOTJjY2VkYjU2NDgifV0.g7HSTzF-cVxRA4VFp4lRvX6WrFLErl5gf22-JN8dNl0"
/// friend_circle_pic : "https://s2-cdn.oneitfarm.com/Fs6ygR3DGFm-64P23a5ah52I3fWs"
/// signature : ""
/// area : ""
/// area_type : "0"
/// only_friend : "2"
/// only_three_day : "2"
/// only_stranger_ten : "2"
/// new_circle_id : "110"
/// wss_url : "wss://im.cnradish.com:32135"
/// zone_url : ""
/// zone_name : ""
/// zone_token : ""

class UserData {
  UserData({
      String? appkey, 
      String? channel, 
      String? currAppkey, 
      String? currChannel, 
      String? accountId, 
      String? name, 
      String? nickname, 
      String? avatar, 
      String? email, 
      String? gender, 
      String? phone, 
      String? subOrgKey, 
      String? subOrgName, 
      String? appType, 
      String? sysMsgUnreadNum, 
      String? chatId, 
      String? personalAccount, 
      String? personalAccountUpdate, 
      String? birth, 
      String? provinceCode, 
      String? verify, 
      String? token, 
      String? friendCirclePic, 
      String? signature, 
      String? area, 
      String? areaType, 
      String? onlyFriend, 
      String? onlyThreeDay, 
      String? onlyStrangerTen, 
      String? newCircleId, 
      String? wssUrl, 
      String? zoneUrl, 
      String? zoneName, 
      String? zoneToken,}){
    _appkey = appkey;
    _channel = channel;
    _currAppkey = currAppkey;
    _currChannel = currChannel;
    _accountId = accountId;
    _name = name;
    _nickname = nickname;
    _avatar = avatar;
    _email = email;
    _gender = gender;
    _phone = phone;
    _subOrgKey = subOrgKey;
    _subOrgName = subOrgName;
    _appType = appType;
    _sysMsgUnreadNum = sysMsgUnreadNum;
    _chatId = chatId;
    _personalAccount = personalAccount;
    _personalAccountUpdate = personalAccountUpdate;
    _birth = birth;
    _provinceCode = provinceCode;
    _verify = verify;
    _token = token;
    _friendCirclePic = friendCirclePic;
    _signature = signature;
    _area = area;
    _areaType = areaType;
    _onlyFriend = onlyFriend;
    _onlyThreeDay = onlyThreeDay;
    _onlyStrangerTen = onlyStrangerTen;
    _newCircleId = newCircleId;
    _wssUrl = wssUrl;
    _zoneUrl = zoneUrl;
    _zoneName = zoneName;
    _zoneToken = zoneToken;
}

  UserData.fromJson(dynamic json) {
    _appkey = json['appkey'];
    _channel = json['channel'];
    _currAppkey = json['curr_appkey'];
    _currChannel = json['curr_channel'];
    _accountId = json['account_id'];
    _name = json['name'];
    _nickname = json['nickname'];
    _avatar = json['avatar'];
    _email = json['email'];
    _gender = json['gender'];
    _phone = json['phone'];
    _subOrgKey = json['sub_org_key'];
    _subOrgName = json['sub_org_name'];
    _appType = json['app_type'];
    _sysMsgUnreadNum = json['sys_msg_unread_num'];
    _chatId = json['chat_id'];
    _personalAccount = json['personal_account'];
    _personalAccountUpdate = json['personal_account_update'];
    _birth = json['birth'];
    _provinceCode = json['province_code'];
    _verify = json['verify'];
    _token = json['token'];
    _friendCirclePic = json['friend_circle_pic'];
    _signature = json['signature'];
    _area = json['area'];
    _areaType = json['area_type'];
    _onlyFriend = json['only_friend'];
    _onlyThreeDay = json['only_three_day'];
    _onlyStrangerTen = json['only_stranger_ten'];
    _newCircleId = json['new_circle_id'];
    _wssUrl = json['wss_url'];
    _zoneUrl = json['zone_url'];
    _zoneName = json['zone_name'];
    _zoneToken = json['zone_token'];
  }
  String? _appkey;
  String? _channel;
  String? _currAppkey;
  String? _currChannel;
  String? _accountId;
  String? _name;
  String? _nickname;
  String? _avatar;
  String? _email;
  String? _gender;
  String? _phone;
  String? _subOrgKey;
  String? _subOrgName;
  String? _appType;
  String? _sysMsgUnreadNum;
  String? _chatId;
  String? _personalAccount;
  String? _personalAccountUpdate;
  String? _birth;
  String? _provinceCode;
  String? _verify;
  String? _token;
  String? _friendCirclePic;
  String? _signature;
  String? _area;
  String? _areaType;
  String? _onlyFriend;
  String? _onlyThreeDay;
  String? _onlyStrangerTen;
  String? _newCircleId;
  String? _wssUrl;
  String? _zoneUrl;
  String? _zoneName;
  String? _zoneToken;
UserData copyWith({  String? appkey,
  String? channel,
  String? currAppkey,
  String? currChannel,
  String? accountId,
  String? name,
  String? nickname,
  String? avatar,
  String? email,
  String? gender,
  String? phone,
  String? subOrgKey,
  String? subOrgName,
  String? appType,
  String? sysMsgUnreadNum,
  String? chatId,
  String? personalAccount,
  String? personalAccountUpdate,
  String? birth,
  String? provinceCode,
  String? verify,
  String? token,
  String? friendCirclePic,
  String? signature,
  String? area,
  String? areaType,
  String? onlyFriend,
  String? onlyThreeDay,
  String? onlyStrangerTen,
  String? newCircleId,
  String? wssUrl,
  String? zoneUrl,
  String? zoneName,
  String? zoneToken,
}) => UserData(  appkey: appkey ?? _appkey,
  channel: channel ?? _channel,
  currAppkey: currAppkey ?? _currAppkey,
  currChannel: currChannel ?? _currChannel,
  accountId: accountId ?? _accountId,
  name: name ?? _name,
  nickname: nickname ?? _nickname,
  avatar: avatar ?? _avatar,
  email: email ?? _email,
  gender: gender ?? _gender,
  phone: phone ?? _phone,
  subOrgKey: subOrgKey ?? _subOrgKey,
  subOrgName: subOrgName ?? _subOrgName,
  appType: appType ?? _appType,
  sysMsgUnreadNum: sysMsgUnreadNum ?? _sysMsgUnreadNum,
  chatId: chatId ?? _chatId,
  personalAccount: personalAccount ?? _personalAccount,
  personalAccountUpdate: personalAccountUpdate ?? _personalAccountUpdate,
  birth: birth ?? _birth,
  provinceCode: provinceCode ?? _provinceCode,
  verify: verify ?? _verify,
  token: token ?? _token,
  friendCirclePic: friendCirclePic ?? _friendCirclePic,
  signature: signature ?? _signature,
  area: area ?? _area,
  areaType: areaType ?? _areaType,
  onlyFriend: onlyFriend ?? _onlyFriend,
  onlyThreeDay: onlyThreeDay ?? _onlyThreeDay,
  onlyStrangerTen: onlyStrangerTen ?? _onlyStrangerTen,
  newCircleId: newCircleId ?? _newCircleId,
  wssUrl: wssUrl ?? _wssUrl,
  zoneUrl: zoneUrl ?? _zoneUrl,
  zoneName: zoneName ?? _zoneName,
  zoneToken: zoneToken ?? _zoneToken,
);
  String? get appkey => _appkey;
  String? get channel => _channel;
  String? get currAppkey => _currAppkey;
  String? get currChannel => _currChannel;
  String? get accountId => _accountId;
  String? get name => _name;
  String? get nickname => _nickname;
  String? get avatar => _avatar;
  String? get email => _email;
  String? get gender => _gender;
  String? get phone => _phone;
  String? get subOrgKey => _subOrgKey;
  String? get subOrgName => _subOrgName;
  String? get appType => _appType;
  String? get sysMsgUnreadNum => _sysMsgUnreadNum;
  String? get chatId => _chatId;
  String? get personalAccount => _personalAccount;
  String? get personalAccountUpdate => _personalAccountUpdate;
  String? get birth => _birth;
  String? get provinceCode => _provinceCode;
  String? get verify => _verify;
  String? get token => _token;
  String? get friendCirclePic => _friendCirclePic;
  String? get signature => _signature;
  String? get area => _area;
  String? get areaType => _areaType;
  String? get onlyFriend => _onlyFriend;
  String? get onlyThreeDay => _onlyThreeDay;
  String? get onlyStrangerTen => _onlyStrangerTen;
  String? get newCircleId => _newCircleId;
  String? get wssUrl => _wssUrl;
  String? get zoneUrl => _zoneUrl;
  String? get zoneName => _zoneName;
  String? get zoneToken => _zoneToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appkey'] = _appkey;
    map['channel'] = _channel;
    map['curr_appkey'] = _currAppkey;
    map['curr_channel'] = _currChannel;
    map['account_id'] = _accountId;
    map['name'] = _name;
    map['nickname'] = _nickname;
    map['avatar'] = _avatar;
    map['email'] = _email;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['sub_org_key'] = _subOrgKey;
    map['sub_org_name'] = _subOrgName;
    map['app_type'] = _appType;
    map['sys_msg_unread_num'] = _sysMsgUnreadNum;
    map['chat_id'] = _chatId;
    map['personal_account'] = _personalAccount;
    map['personal_account_update'] = _personalAccountUpdate;
    map['birth'] = _birth;
    map['province_code'] = _provinceCode;
    map['verify'] = _verify;
    map['token'] = _token;
    map['friend_circle_pic'] = _friendCirclePic;
    map['signature'] = _signature;
    map['area'] = _area;
    map['area_type'] = _areaType;
    map['only_friend'] = _onlyFriend;
    map['only_three_day'] = _onlyThreeDay;
    map['only_stranger_ten'] = _onlyStrangerTen;
    map['new_circle_id'] = _newCircleId;
    map['wss_url'] = _wssUrl;
    map['zone_url'] = _zoneUrl;
    map['zone_name'] = _zoneName;
    map['zone_token'] = _zoneToken;
    return map;
  }

}
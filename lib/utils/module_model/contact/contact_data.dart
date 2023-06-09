class ContactData {
  ContactData({
    String? accountId,
    String? name,
    String? avatar,
    String? gender,
    String? nickname,
    String? email,
    String? appkey,
    String? phone,
    String? subOrgKey,
    String? subOrgName,
    String? chatId,
    String? department,
    String? post,
    String? jobTitle,
    String? note,
    List<String>? label,
    String? top,
    String? disturb,}){
    _accountId = accountId;
    _name = name;
    _avatar = avatar;
    _gender = gender;
    _nickname = nickname;
    _email = email;
    _phone = phone;
    _subOrgKey = subOrgKey;
    _subOrgName = subOrgName;
    _chatId = chatId;
    _department = department;
    _post = post;
    _jobTitle = jobTitle;
    _isBlock = isBlock;
    _note = note;
  }

  ContactData.fromJson(dynamic json) {
    _accountId = json['account_id'];
    _name = json['name'];
    _avatar = json['avatar'];
    _gender = json['gender'];
    _nickname = json['nickname'];
    _email = json['email'];
    _phone = json['phone'];
    _subOrgKey = json['sub_org_key'];
    _subOrgName = json['sub_org_name'];
    _chatId = json['chat_id'];
    _department = json['department'];
    _post = json['post'];
    _jobTitle = json['job_title'];
    _note = json['note'];
  }
  String? _accountId;
  String? _name;
  String? _avatar;
  String? _gender;
  String? _nickname;
  String? _email;
  String? _phone;
  String? _subOrgKey;
  String? _subOrgName;
  String? _chatId;
  String? _department;
  String? _post;
  String? _jobTitle;
  String? _isBlock;
  String? _note;
  ContactData copyWith({  String? accountId,
    String? name,
    String? avatar,
    String? gender,
    String? nickname,
    String? email,
    String? userType,
    String? appkey,
    String? channel,
    String? phone,
    String? subOrgKey,
    String? subOrgName,
    String? chatId,
    String? department,
    String? post,
    String? jobTitle,
  }) => ContactData(  accountId: accountId ?? _accountId,
    name: name ?? _name,
    avatar: avatar ?? _avatar,
    gender: gender ?? _gender,
    nickname: nickname ?? _nickname,
    email: email ?? _email,
    phone: phone ?? _phone,
    subOrgKey: subOrgKey ?? _subOrgKey,
    subOrgName: subOrgName ?? _subOrgName,
    chatId: chatId ?? _chatId,
    department: department ?? _department,
    post: post ?? _post,
    jobTitle: jobTitle ?? _jobTitle,
    note: note ?? _note,
  );
  String? get accountId => _accountId;
  String? get name => _name;
  String? get avatar => _avatar;
  String? get gender => _gender;
  String? get nickname => _nickname;
  String? get email => _email;
  String? get phone => _phone;
  String? get subOrgKey => _subOrgKey;
  String? get subOrgName => _subOrgName;
  String? get chatId => _chatId;
  String? get department => _department;
  String? get post => _post;
  String? get jobTitle => _jobTitle;
  String? get isBlock => _isBlock;
  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_id'] = _accountId;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['gender'] = _gender;
    map['nickname'] = _nickname;
    map['email'] = _email;
    map['phone'] = _phone;
    map['sub_org_key'] = _subOrgKey;
    map['sub_org_name'] = _subOrgName;
    map['chat_id'] = _chatId;
    map['department'] = _department;
    map['post'] = _post;
    map['job_title'] = _jobTitle;
    map['is_block'] = _isBlock;
    map['note'] = _note;
    return map;
  }

}
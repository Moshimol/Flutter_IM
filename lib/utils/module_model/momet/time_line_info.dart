class TimeLineInfo {
  String? id;
  String? appkey;
  String? channel;
  String? uid;
  String? type;
  String? content;
  String? forwardContent;
  String? forwardUrl;
  String? position;
  String? commentNum;
  String? likeNum;
  String? jurisdictionType;
  String? deleted;
  String? createdAt;
  String? updatedAt;
  Creator? creator;
  List<Resources>? resources;
  int? createTimestamp;
  List<TimeLineUser>? comments;
  List<TimeLineUser>? likes;
  bool? isLike;

  TimeLineInfo(
      {this.id,
        this.appkey,
        this.channel,
        this.uid,
        this.type,
        this.content,
        this.forwardContent,
        this.forwardUrl,
        this.position,
        this.commentNum,
        this.likeNum,
        this.jurisdictionType,
        this.deleted,
        this.createdAt,
        this.updatedAt,
        this.creator,
        this.resources,
        this.createTimestamp,
        this.comments,
        this.likes,
        this.isLike});

  TimeLineInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appkey = json['appkey'];
    channel = json['channel'];
    uid = json['uid'];
    type = json['type'];
    content = json['content'];
    forwardContent = json['forward_content'];
    forwardUrl = json['forward_url'];
    position = json['position'];
    commentNum = json['comment_num'];
    likeNum = json['like_num'];
    jurisdictionType = json['jurisdiction_type'];
    deleted = json['deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    if (json['resources'] != null) {
      resources = <Resources>[];
      json['resources'].forEach((v) {
        resources!.add(new Resources.fromJson(v));
      });
    }
    createTimestamp = json['create_timestamp'];
    if (json['comments'] != null) {
      comments = <TimeLineUser>[];
      json['comments'].forEach((v) {
        comments!.add(new TimeLineUser.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <TimeLineUser>[];
      json['likes'].forEach((v) {
        likes!.add(new TimeLineUser.fromJson(v));
      });
    }
    isLike = json['is_like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appkey'] = this.appkey;
    data['channel'] = this.channel;
    data['uid'] = this.uid;
    data['type'] = this.type;
    data['content'] = this.content;
    data['forward_content'] = this.forwardContent;
    data['forward_url'] = this.forwardUrl;
    data['position'] = this.position;
    data['comment_num'] = this.commentNum;
    data['like_num'] = this.likeNum;
    data['jurisdiction_type'] = this.jurisdictionType;
    data['deleted'] = this.deleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    if (this.resources != null) {
      // data['resources'] = this.resources!.map((v) => v.toJson()).toList();
    }
    data['create_timestamp'] = this.createTimestamp;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    data['is_like'] = this.isLike;
    return data;
  }
}

class Creator {
  String? uid;
  String? name;
  String? chatId;
  String? subOrgKey;
  String? nickname;
  String? note;
  String? avatar;
  String? accountId;

  Creator(
      {this.uid,
        this.name,
        this.chatId,
        this.subOrgKey,
        this.nickname,
        this.note,
        this.avatar,
        this.accountId});

  Creator.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    chatId = json['chat_id'];
    subOrgKey = json['sub_org_key'];
    nickname = json['nickname'];
    note = json['note'];
    avatar = json['avatar'];
    accountId = json['account_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['chat_id'] = this.chatId;
    data['sub_org_key'] = this.subOrgKey;
    data['nickname'] = this.nickname;
    data['note'] = this.note;
    data['avatar'] = this.avatar;
    data['account_id'] = this.accountId;
    return data;
  }
}

class Resources {
  String? url;
  int? width;
  int? height;

  Resources(
      {this.url,
        this.width,
        this.height,});

  Resources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class TimeLineUser {
  String? uid;
  String? name;
  String? chatId;
  String? subOrgKey;
  String? nickname;
  String? avatar;
  String? accountId;

  TimeLineUser(
      {this.uid,
        this.name,
        this.chatId,
        this.subOrgKey,
        this.nickname,
        this.avatar,
        this.accountId});

  TimeLineUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    chatId = json['chat_id'];
    subOrgKey = json['sub_org_key'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    accountId = json['account_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['chat_id'] = this.chatId;
    data['sub_org_key'] = this.subOrgKey;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['account_id'] = this.accountId;
    return data;
  }
}

class ChatMessageInfo {
  String? msgid;
  String? fromAppkey;
  String? fromChannel;
  String? fromAccountId;
  String? fromChatId;
  String? refMsgId;
  List<Null>? refMsg;
  String? toAppkey;
  String? toChannel;
  String? toAccountId;
  String? toChatId;
  String? read;
  String? star;
  String? ext;
  String? created;
  String? createdShow;
  String? retract;
  Content? content;
  String? contentOrigin;

  ChatMessageInfo(
      {this.msgid,
        this.fromAppkey,
        this.fromChannel,
        this.fromAccountId,
        this.fromChatId,
        this.refMsgId,
        this.toAppkey,
        this.toChannel,
        this.toAccountId,
        this.toChatId,
        this.read,
        this.star,
        this.ext,
        this.created,
        this.createdShow,
        this.retract,
        this.content,
        this.contentOrigin});

  ChatMessageInfo.fromJson(Map<String, dynamic> json) {
    msgid = json['msgid'];
    fromAppkey = json['from_appkey'];
    fromChannel = json['from_channel'];
    fromAccountId = json['from_account_id'];
    fromChatId = json['from_chat_id'];
    refMsgId = json['ref_msg_id'];
    toAppkey = json['to_appkey'];
    toChannel = json['to_channel'];
    toAccountId = json['to_account_id'];
    toChatId = json['to_chat_id'];
    read = json['read'];
    star = json['star'];
    ext = json['ext'];
    created = json['created'];
    createdShow = json['created_show'];
    retract = json['retract'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    contentOrigin = json['content_origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgid'] = this.msgid;
    data['from_appkey'] = this.fromAppkey;
    data['from_channel'] = this.fromChannel;
    data['from_account_id'] = this.fromAccountId;
    data['from_chat_id'] = this.fromChatId;
    data['ref_msg_id'] = this.refMsgId;
    data['to_appkey'] = this.toAppkey;
    data['to_channel'] = this.toChannel;
    data['to_account_id'] = this.toAccountId;
    data['to_chat_id'] = this.toChatId;
    data['read'] = this.read;
    data['star'] = this.star;
    data['ext'] = this.ext;
    data['created'] = this.created;
    data['created_show'] = this.createdShow;
    data['retract'] = this.retract;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['content_origin'] = this.contentOrigin;
    return data;
  }
}

class Content {
  String? type;
  String? fileName;
  String? url;
  String? originalUrl;
  Size? size;
  String? fileSize;
  Expand? expand;

  Content(
      {this.type,
        this.fileName,
        this.url,
        this.originalUrl,
        this.size,
        this.fileSize,
        this.expand});

  Content.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    fileName = json['file_name'];
    url = json['url'];
    originalUrl = json['original_url'];
    if (type == "img") {
      size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    } else {
      fileSize = json['size'];
    }

    expand =
    json['expand'] != null ? new Expand.fromJson(json['expand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['file_name'] = this.fileName;
    data['url'] = this.url;
    data['original_url'] = this.originalUrl;
    if (this.size != null &&  data['type'] == "img") {
      data['size'] = this.size!.toJson();
    }
    if (this.expand != null) {
      data['expand'] = this.expand!.toJson();
    }
    return data;
  }
}

class Size {
  int? height;
  int? width;
  String? originalHeight;
  String? originalWidth;
  String? originalSize;

  Size(
      {this.height,
        this.width,
        this.originalHeight,
        this.originalWidth,
        this.originalSize});

  Size.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    originalHeight = json['original_height'];
    originalWidth = json['original_width'];
    originalSize = json['original_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    data['original_height'] = this.originalHeight;
    data['original_width'] = this.originalWidth;
    data['original_size'] = this.originalSize;
    return data;
  }
}

class Expand {
  String? extraInfo;

  Expand({this.extraInfo});

  Expand.fromJson(Map<String, dynamic> json) {
    extraInfo = json['extra_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['extra_info'] = this.extraInfo;
    return data;
  }
}

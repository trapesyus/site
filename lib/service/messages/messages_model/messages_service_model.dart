class MessagesServiceModel {
  List<DocumentsMessages>? documents;

  MessagesServiceModel({this.documents});

  MessagesServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <DocumentsMessages>[];
      json['documents'].forEach((v) {
        documents!.add(DocumentsMessages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DocumentsMessages {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  DocumentsMessages({this.name, this.fields, this.createTime, this.updateTime});

  DocumentsMessages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}

class Fields {
  Comment? comment;
  IsShow? isShow;
  Comment? name;

  Fields({this.comment, this.isShow, this.name});

  Fields.fromJson(Map<String, dynamic> json) {
    comment =
        json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    isShow = json['isShow'] != null ? IsShow.fromJson(json['isShow']) : null;
    name = json['name'] != null ? Comment.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (comment != null) {
      data['comment'] = comment!.toJson();
    }
    if (isShow != null) {
      data['isShow'] = isShow!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class Comment {
  String? stringValue;

  Comment({this.stringValue});

  Comment.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

class IsShow {
  bool? booleanValue;

  IsShow({this.booleanValue});

  IsShow.fromJson(Map<String, dynamic> json) {
    booleanValue = json['booleanValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booleanValue'] = booleanValue;
    return data;
  }
}

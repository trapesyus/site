class PlanServiceModel {
  List<PlanDocuments>? documents;
  String? nextPageToken;

  PlanServiceModel({this.documents, this.nextPageToken});

  PlanServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <PlanDocuments>[];
      json['documents'].forEach((v) {
        documents!.add(PlanDocuments.fromJson(v));
      });
    }
    nextPageToken = json['nextPageToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['nextPageToken'] = nextPageToken;
    return data;
  }
}

class PlanDocuments {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  PlanDocuments({this.name, this.fields, this.createTime, this.updateTime});

  PlanDocuments.fromJson(Map<String, dynamic> json) {
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
  Text? text;
  Text? image;
  Text? content;

  Fields({this.text, this.image, this.content});

  Fields.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? Text.fromJson(json['text']) : null;
    image = json['image'] != null ? Text.fromJson(json['image']) : null;
    content = json['content'] != null ? Text.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (text != null) {
      data['text'] = text!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    return data;
  }
}

class Text {
  String? stringValue;

  Text({this.stringValue});

  Text.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

class ServiceServiceModel {
  List<ServiceDocuments>? documents;

  ServiceServiceModel({this.documents});

  ServiceServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <ServiceDocuments>[];
      json['documents'].forEach((v) {
        documents!.add(ServiceDocuments.fromJson(v));
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

class ServiceDocuments {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  ServiceDocuments({this.name, this.fields, this.createTime, this.updateTime});

  ServiceDocuments.fromJson(Map<String, dynamic> json) {
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
  Image? image;
  Image? content;
  Image? text;

  Fields({this.image, this.content, this.text});

  Fields.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    content = json['content'] != null ? Image.fromJson(json['content']) : null;
    text = json['text'] != null ? Image.fromJson(json['text']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (text != null) {
      data['text'] = text!.toJson();
    }
    return data;
  }
}

class Image {
  String? stringValue;

  Image({this.stringValue});

  Image.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

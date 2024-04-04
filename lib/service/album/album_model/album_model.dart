class AlbumScreenModel {
  List<AlbumDocuments>? documents;

  AlbumScreenModel({this.documents});

  AlbumScreenModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <AlbumDocuments>[];
      json['documents'].forEach((v) {
        documents!.add(new AlbumDocuments.fromJson(v));
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

class AlbumDocuments {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  AlbumDocuments({this.name, this.fields, this.createTime, this.updateTime});

  AlbumDocuments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
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
  AlbumImage? albumImage;

  Fields({this.albumImage});

  Fields.fromJson(Map<String, dynamic> json) {
    albumImage = json['albumImage'] != null
        ? new AlbumImage.fromJson(json['albumImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albumImage != null) {
      data['albumImage'] = albumImage!.toJson();
    }
    return data;
  }
}

class AlbumImage {
  String? stringValue;

  AlbumImage({this.stringValue});

  AlbumImage.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

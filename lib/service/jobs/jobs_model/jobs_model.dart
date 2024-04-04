class JobsServiceModel {
  List<Documents>? documents;

  JobsServiceModel({this.documents});

  JobsServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
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

class Documents {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  Documents({this.name, this.fields, this.createTime, this.updateTime});

  Documents.fromJson(Map<String, dynamic> json) {
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
  JobTitle? jobTitle;
  JobTitle? jobImage;
  JobTitle? jobSubTitle;

  Fields({this.jobTitle, this.jobImage, this.jobSubTitle});

  Fields.fromJson(Map<String, dynamic> json) {
    jobTitle =
        json['jobTitle'] != null ? JobTitle.fromJson(json['jobTitle']) : null;
    jobImage =
        json['jobImage'] != null ? JobTitle.fromJson(json['jobImage']) : null;
    jobSubTitle = json['jobSubTitle'] != null
        ? JobTitle.fromJson(json['jobSubTitle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobTitle != null) {
      data['jobTitle'] = jobTitle!.toJson();
    }
    if (jobImage != null) {
      data['jobImage'] = jobImage!.toJson();
    }
    if (jobSubTitle != null) {
      data['jobSubTitle'] = jobSubTitle!.toJson();
    }
    return data;
  }
}

class JobTitle {
  String? stringValue;

  JobTitle({this.stringValue});

  JobTitle.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

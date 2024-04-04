class ContactInfoModel {
  Adress? adress;
  String? facebook;
  String? instagram;
  String? mail;
  String? phone;
  String? whatsapp;
  String? x;

  ContactInfoModel(
      {this.adress,
      this.facebook,
      this.instagram,
      this.mail,
      this.phone,
      this.whatsapp,
      this.x});

  ContactInfoModel.fromJson(Map<String, dynamic> json) {
    adress = json['adress'] != null ? Adress.fromJson(json['adress']) : null;
    facebook = json['facebook'];
    instagram = json['instagram'];
    mail = json['mail'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    x = json['x'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (adress != null) {
      data['adress'] = adress!.toJson();
    }
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['mail'] = mail;
    data['phone'] = phone;
    data['whatsapp'] = whatsapp;
    data['x'] = x;
    return data;
  }
}

class Adress {
  double? latitude;
  double? longtitude;

  Adress({this.latitude, this.longtitude});

  Adress.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longtitude = json['longtitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longtitude'] = longtitude;
    return data;
  }
}

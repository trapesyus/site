class ContactScreenServiceModel {
  String? image;
  String? text;

  ContactScreenServiceModel({this.image, this.text});

  ContactScreenServiceModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['text'] = text;
    return data;
  }
}

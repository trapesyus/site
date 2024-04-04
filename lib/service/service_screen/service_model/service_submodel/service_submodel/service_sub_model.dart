class ServiceSubModel {
  String? mainImage;
  String? mainText;

  ServiceSubModel({this.mainImage, this.mainText});

  ServiceSubModel.fromJson(Map<String, dynamic> json) {
    mainImage = json['mainImage'];
    mainText = json['mainText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mainImage'] = mainImage;
    data['mainText'] = mainText;
    return data;
  }
}

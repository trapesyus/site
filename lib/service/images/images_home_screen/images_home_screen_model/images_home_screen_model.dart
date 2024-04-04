class ImageServiceModel {
  String? aboutImage;
  String? logoImage;
  String? mainImage;
  String? placesImage;

  ImageServiceModel(
      {this.aboutImage, this.logoImage, this.mainImage, this.placesImage});

  ImageServiceModel.fromJson(Map<String, dynamic> json) {
    aboutImage = json['aboutImage'];
    logoImage = json['logoImage'];
    mainImage = json['mainImage'];
    placesImage = json['placesImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aboutImage'] = aboutImage;
    data['logoImage'] = logoImage;
    data['mainImage'] = mainImage;
    data['placesImage'] = placesImage;
    return data;
  }
}

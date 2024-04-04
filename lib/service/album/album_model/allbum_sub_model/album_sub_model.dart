class AlbumsSubScreenModel {
  String? mainImage;
  String? mainText;

  AlbumsSubScreenModel({this.mainImage, this.mainText});

  AlbumsSubScreenModel.fromJson(Map<String, dynamic> json) {
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

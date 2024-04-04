class WordsServiceModel {
  String? aboutContent;
  String? aboutSubTitle;
  String? aboutTitle;
  String? blogContent;
  String? blogSubTitle;
  String? blogTitle;
  String? eventopyaAbout;
  String? eventopyaAdress;
  String? eventopyaMail;
  int? eventopyaPhone;
  String? memoriesContent;
  String? memoriesSubTitle;
  String? memoriesTitle;
  String? opinionsContent;
  String? opinionsSubTitle;
  String? opinionsTitle;
  String? placesContent;
  String? placesSubTitle;
  String? placesTitle;
  String? slogan;

  WordsServiceModel(
      {this.aboutContent,
      this.aboutSubTitle,
      this.aboutTitle,
      this.blogContent,
      this.blogSubTitle,
      this.blogTitle,
      this.eventopyaAbout,
      this.eventopyaAdress,
      this.eventopyaMail,
      this.eventopyaPhone,
      this.memoriesContent,
      this.memoriesSubTitle,
      this.memoriesTitle,
      this.opinionsContent,
      this.opinionsSubTitle,
      this.opinionsTitle,
      this.placesContent,
      this.placesSubTitle,
      this.placesTitle,
      this.slogan});

  WordsServiceModel.fromJson(Map<String, dynamic> json) {
    aboutContent = json['aboutContent'];
    aboutSubTitle = json['aboutSubTitle'];
    aboutTitle = json['aboutTitle'];
    blogContent = json['blogContent'];
    blogSubTitle = json['blogSubTitle'];
    blogTitle = json['blogTitle'];
    eventopyaAbout = json['eventopyaAbout'];
    eventopyaAdress = json['eventopyaAdress'];
    eventopyaMail = json['eventopyaMail'];
    eventopyaPhone = json['eventopyaPhone'];
    memoriesContent = json['memoriesContent'];
    memoriesSubTitle = json['memoriesSubTitle'];
    memoriesTitle = json['memoriesTitle'];
    opinionsContent = json['opinionsContent'];
    opinionsSubTitle = json['opinionsSubTitle'];
    opinionsTitle = json['opinionsTitle'];
    placesContent = json['placesContent'];
    placesSubTitle = json['placesSubTitle'];
    placesTitle = json['placesTitle'];
    slogan = json['slogan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aboutContent'] = aboutContent;
    data['aboutSubTitle'] = aboutSubTitle;
    data['aboutTitle'] = aboutTitle;
    data['blogContent'] = blogContent;
    data['blogSubTitle'] = blogSubTitle;
    data['blogTitle'] = blogTitle;
    data['eventopyaAbout'] = eventopyaAbout;
    data['eventopyaAdress'] = eventopyaAdress;
    data['eventopyaMail'] = eventopyaMail;
    data['eventopyaPhone'] = eventopyaPhone;
    data['memoriesContent'] = memoriesContent;
    data['memoriesSubTitle'] = memoriesSubTitle;
    data['memoriesTitle'] = memoriesTitle;
    data['opinionsContent'] = opinionsContent;
    data['opinionsSubTitle'] = opinionsSubTitle;
    data['opinionsTitle'] = opinionsTitle;
    data['placesContent'] = placesContent;
    data['placesSubTitle'] = placesSubTitle;
    data['placesTitle'] = placesTitle;
    data['slogan'] = slogan;
    return data;
  }
}

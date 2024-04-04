enum LinkEnum {
  instagramLink('https://www.instagram.com/eventopya/'),
  facebookLink(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/articles.json'),
  twitterLink(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/images.json');

  const LinkEnum(this.link);
  final String link;
}

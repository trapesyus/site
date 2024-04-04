enum UrlEnum {
  urlStrings(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/strings.json'),

  urlImages(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/images.json'),
  urlContactInfo(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/contactInfo.json'),

  urlJobs(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/jobs'),
  urlMessages(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/messages'),
  urlPlanScreenMainImageText(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/planScreen.json'),
  urlContactUsScreenImageText(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/contactScreen.json'),
  urlPlanScreen(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/planScreen'),
  urlAlbumScreen(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreen'),
  urlAlbumScreenAnniversary(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenAnniversary'),
  urlAlbumScreenAskGirl(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenAskGirl'),
  urlAlbumScreenBabyShower(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenBabyShower'),
  urlAlbumScreenBirthDay(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenBirthDay'),
  urlAlbumScreenBridalBath(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenBridalBath'),
  urlAlbumScreenBrideToBe(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenBrideToBe'),
  urlAlbumScreenCircumCision(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenCircumcision'),
  urlAlbumScreenEngagement(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenEngagement'),
  urlAlbumScreenHenna(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenHenna'),
  urlAlbumScreenMarriageProposal(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenMarriageProposal'),
  urlAlbumScreenNewYear(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenNewYear'),
  urlAlbumScreenOpening(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenOpening'),
  urlAlbumScreenWedding(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/albumScreenWedding'),
  urlServicesScreenMainImageText(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/serviceScreen.json'),
  urlServicesScreen(
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/serviceScreen'),
  urlAlbumsScreenMainImageText(
      'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/albumScreen.json');

  const UrlEnum(this.url);
  final String url;
}

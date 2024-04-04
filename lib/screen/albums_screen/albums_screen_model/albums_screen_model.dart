import 'package:mobx/mobx.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/album/album_model/album_model.dart';
import 'package:wedding_organise/service/album/album_model/allbum_sub_model/album_sub_model.dart';
import 'package:wedding_organise/service/album/album_service/album_service.dart';
import 'package:wedding_organise/service/album/album_service/album_sub_service/album_sub_service.dart';
part 'albums_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class AlbumsScreenModel = _AlbumsScreenModelBase with _$AlbumsScreenModel;

abstract class _AlbumsScreenModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String imageLoadError =
      'https://w7.pngwing.com/pngs/319/145/png-transparent-404-universe-404-digital-universe.png';
  @observable
  String textLoadError = 'Bir Hata Oluştu';

  @observable
  List<AlbumDocuments> albumScreenAnnivesary = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenAskGirl = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBabyShower = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBirthDay = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBridalBath = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBrideToBe = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenCircumcision = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenEngagement = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenHenna = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenMarriageProposal = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenNewYear = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenOpening = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenWedding = ObservableList.of([]);

  final AlbumScreenService _albumScreenService = AlbumScreenService();

  @action
  Future<void> initialize() async {
    await getScreenItems();
    await getAlbumScreenAnnivesary();
    await getAlbumScreenAskGirl();
    await getAlbumScreenBabyShower();
    await getAlbumScreenBirthDay();
    await getAlbumScreenBridalBath();
    await getAlbumScreenBrideToBe();
    await getAlbumScreenCircumcision();
    await getAlbumScreenEngagement();
    await getAlbumScreenHenna();
    await getAlbumScreenMarriageProposal();
    await getAlbumScreenNewYear();
    await getAlbumScreenOpening();
    await getAlbumScreenWedding().whenComplete(() => isLoading = true);
  }

  @observable
  AlbumsSubScreenModel mainItems = AlbumsSubScreenModel();
  final AlbumSubService _albumSubService = AlbumSubService();

  Future<void> getScreenItems() async {
    mainItems = (await _albumSubService.getAlbumScreenMainImageText())!;
  }

  Future<void> getAlbumScreenAnnivesary() async {
    albumScreenAnnivesary = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenAnniversary.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenAskGirl() async {
    albumScreenAskGirl = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenAskGirl.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBabyShower() async {
    albumScreenBabyShower = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBabyShower.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBirthDay() async {
    albumScreenBirthDay = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBirthDay.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBridalBath() async {
    albumScreenBridalBath = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBridalBath.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBrideToBe() async {
    albumScreenBrideToBe = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBrideToBe.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenCircumcision() async {
    albumScreenCircumcision = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenCircumCision.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenEngagement() async {
    albumScreenEngagement = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenEngagement.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenHenna() async {
    albumScreenHenna = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenHenna.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenMarriageProposal() async {
    albumScreenMarriageProposal = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenMarriageProposal.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenNewYear() async {
    albumScreenNewYear = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenNewYear.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenOpening() async {
    albumScreenOpening = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenOpening.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenWedding() async {
    albumScreenWedding = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenWedding.url)) ??
        [];
  }
}

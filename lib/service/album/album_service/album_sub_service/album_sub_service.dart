import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/album/album_model/allbum_sub_model/album_sub_model.dart';

class AlbumSubService {
  final Dio _dio = Dio();
  Future<AlbumsSubScreenModel>? getAlbumScreenMainImageText() async {
    final Response response =
        await _dio.get(UrlEnum.urlAlbumsScreenMainImageText.url);
    if (response.statusCode != 200) {
      return AlbumsSubScreenModel();
    }
    final jsonBody = AlbumsSubScreenModel.fromJson(response.data);
    return jsonBody;
  }

  Future<void> patchAlbumScreenMainText({required String text}) async {
    final Map<String, dynamic> data = {'mainText': text};
    await _dio.patch(UrlEnum.urlAlbumsScreenMainImageText.url, data: data);
  }

  Future<void> patchAlbumScreenMainImage({required String image}) async {
    final Map<String, dynamic> data = {'mainImage': image};
    await _dio.patch(UrlEnum.urlServicesScreen.url, data: data);
  }

  Future<void> patchAlbumScreenItems(
      {required String link, required String image}) async {
    Map<String, dynamic> data = {
      'fields': {
        'albumImage': {'stringValue': image}
      }
    };
    await _dio.patch(link, data: data);
  }

  Future<void> deleteAlbumScreenItems({required String url}) async {
    await _dio.delete(url);
  }

  Future<void> postAlbumScreenItems(
      {required String image, required String link}) async {
    Map<String, dynamic> data = {
      'fields': {
        'albumImage': {'stringValue': image}
      }
    };
    await _dio.post(link, data: data);
  }
}

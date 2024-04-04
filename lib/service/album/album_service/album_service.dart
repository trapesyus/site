import 'package:dio/dio.dart';
import 'package:wedding_organise/service/album/album_model/album_model.dart';

class AlbumScreenService {
  final Dio _dio = Dio();

  Future<List<AlbumDocuments>?> getAlbumScreen({required String url}) async {
    final Response response = await _dio.get(url);
    if (response.statusCode != 200 || response.data == null) {
      return [];
    }

    final AlbumScreenModel jsonBody = AlbumScreenModel.fromJson(response.data);
    return jsonBody.documents;
  }
}

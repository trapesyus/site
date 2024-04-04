import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/images/images_home_screen/images_home_screen_model/images_home_screen_model.dart';

class ImageService {
  final Dio _dio = Dio();

  Future getImagesHomePage() async {
    final Response request = await _dio.get(UrlEnum.urlImages.url);
    if (request.statusCode != 200 || request.data == null) return;
    final jsonBody = request.data;
    final ImageServiceModel imageServiceModel =
        ImageServiceModel.fromJson(jsonBody);
    return imageServiceModel;
  }

  Future<void> patchImageHomePage(
      {required String key, required String value}) async {
    final update = {key: value};
    await _dio.patch(UrlEnum.urlImages.url, data: update);
  }
}

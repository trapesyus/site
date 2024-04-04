import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';

import '../../service_model/service_submodel/service_submodel/service_sub_model.dart';

class ServiceSubService {
  final Dio _dio = Dio();
  Future<ServiceSubModel>? getServicesScreenMainImageText() async {
    final Response response =
        await _dio.get(UrlEnum.urlServicesScreenMainImageText.url);
    if (response.statusCode != 200) {
      return ServiceSubModel();
    }
    final jsonBody = ServiceSubModel.fromJson(response.data);
    return jsonBody;
  }

  Future<void> patchServicesScreenMainText({required String text}) async {
    final Map<String, dynamic> data = {'mainText': text};
    await _dio.patch(UrlEnum.urlServicesScreenMainImageText.url, data: data);
  }

  Future<void> patchgetServicesScreenMainImage({required String image}) async {
    final Map<String, dynamic> data = {'mainImage': image};
    await _dio.patch(UrlEnum.urlServicesScreen.url, data: data);
  }

  Future<void> patchServicesScreenItems(
      {required String link,
      required String text,
      required String content,
      required String image}) async {
    Map<String, dynamic> data = {
      'fields': {
        'content': {'stringValue': content},
        'text': {'stringValue': text},
        'image': {'stringValue': image}
      }
    };
    await _dio.patch(link, data: data);
  }

  Future<void> deleteServicesScreenItems({required String url}) async {
    await _dio.delete(url);
  }

  Future<void> postServicesScreenItems(
      {required String image,
      required String text,
      required String content}) async {
    Map<String, dynamic> data = {
      'fields': {
        'text': {'stringValue': text},
        'content': {'stringValue': content},
        'image': {'stringValue': image}
      }
    };
    await _dio.post(UrlEnum.urlServicesScreen.url, data: data);
  }
}

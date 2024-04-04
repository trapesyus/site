import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';

import '../service_model/service_service_model.dart';

class ServiceService {
  final Dio _dio = Dio();

  Future<List<ServiceDocuments>?> getServiceScreenItems() async {
    final Response response = await _dio.get(UrlEnum.urlServicesScreen.url);
    log(response.statusCode.toString());
    if (response.data == null) {
      log('değer null geliyor');
    } else {
      log('değer null gelmiyor');
    }
    if (response.statusCode != 200 || response.data == null) {
      return List.empty();
    }
    final jsonBody = ServiceServiceModel.fromJson(response.data);

    return jsonBody.documents;
  }
}

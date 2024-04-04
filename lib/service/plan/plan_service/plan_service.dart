import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/plan/plan_model/plan_service_model.dart';

class PlanService {
  final Dio _dio = Dio();

  Future<List<PlanDocuments>?> getPlanScreenItems() async {
    final Response response = await _dio.get(UrlEnum.urlPlanScreen.url);
    log(response.statusCode.toString());
    if (response.data == null) {
      log('değer null geliyor');
    } else {
      log('değer null gelmiyor');
    }
    if (response.statusCode != 200 || response.data == null) {
      return List.empty();
    }
    final jsonBody = PlanServiceModel.fromJson(response.data);

    return jsonBody.documents;
  }
}

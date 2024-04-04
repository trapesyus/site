import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/plan/plan_model/plan_submodel/plan_sub_model.dart';

class PlanSubService {
  final Dio _dio = Dio();
  Future<PlanSubModel>? getPlanScreenMainImageText() async {
    final Response response =
        await _dio.get(UrlEnum.urlPlanScreenMainImageText.url);
    if (response.statusCode != 200) {
      return PlanSubModel();
    }
    final jsonBody = PlanSubModel.fromJson(response.data);
    return jsonBody;
  }

  Future<void> patchPlanScreenMainText({required String text}) async {
    final Map<String, dynamic> data = {'mainText': text};
    await _dio.patch(UrlEnum.urlPlanScreenMainImageText.url, data: data);
  }

  Future<void> patchPlanScreenMainImage({required String image}) async {
    final Map<String, dynamic> data = {'mainImage': image};
    await _dio.patch(UrlEnum.urlPlanScreenMainImageText.url, data: data);
  }

  Future<void> patchPlanScreenItems(
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

  Future<void> deletePlanScreenItems({required String url}) async {
    await _dio.delete(url);
  }

  Future<void> postPlanScreenItems(
      {required String image, required String text}) async {
    Map<String, dynamic> data = {
      'fields': {
        'text': {'stringValue': text},
        'image': {'stringValue': image}
      }
    };
    await _dio.post(UrlEnum.urlPlanScreen.url, data: data);
  }
}

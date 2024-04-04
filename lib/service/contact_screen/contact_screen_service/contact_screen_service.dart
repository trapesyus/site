import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/contact_screen/contact_screen_service_model/contact_screen_service_model.dart';

class ContactScreenService {
  final Dio _dio = Dio();
  Future<ContactScreenServiceModel> getContactScreenItems() async {
    final Response response =
        await _dio.get(UrlEnum.urlContactUsScreenImageText.url);
    if (response.statusCode != 200) {
      return ContactScreenServiceModel();
    }
    final jsonBody = ContactScreenServiceModel.fromJson(response.data);
    return jsonBody;
  }

  Future<void> patchContactScreenImage({required String image}) async {
    final Map<String, dynamic> data = {'image': image};
    await _dio.patch(UrlEnum.urlContactUsScreenImageText.url, data: data);
  }

  Future<void> patchContactScreenText({required String text}) async {
    final Map<String, dynamic> data = {'text': text};
    await _dio.patch(UrlEnum.urlContactUsScreenImageText.url, data: data);
  }
}

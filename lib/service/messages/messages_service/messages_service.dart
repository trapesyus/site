import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/messages/messages_model/messages_service_model.dart';

class MessagesService {
  final Dio _dio = Dio();

  Future<List<DocumentsMessages>?> getMessages() async {
    final response = await _dio.get(UrlEnum.urlMessages.url);
    if (response.statusCode != 200) return List.empty();
    final jsonBody = MessagesServiceModel.fromJson(response.data);

    return jsonBody.documents;
  }

  Future<void> postMessages(
      {required String nameSurname, required String content}) async {
    Map<String, dynamic> data = {
      'fields': {
        'comment': {'stringValue': content},
        'name': {'stringValue': nameSurname},
        'isShow': {'booleanValue': false}
      }
    };
    await _dio.post(UrlEnum.urlMessages.url, data: data);
  }

  Future<void> patchMessages(
      {required String url, required Map<String, dynamic> patchData}) async {
    await _dio.patch(url, data: patchData);
  }

  Future<void> patchIsShowing(
      {required String content,
      required String link,
      required String name,
      required bool isShowing}) async {
    Map<String, dynamic> data = {
      'fields': {
        'comment': {'stringValue': content},
        'name': {'stringValue': name},
        'isShow': {'booleanValue': isShowing}
      }
    };
    await _dio.patch(link, data: data);
  }

  Future<void> deleteMessages({required String url}) async {
    await _dio.delete(url);
  }
}

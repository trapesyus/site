import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/jobs/jobs_model/jobs_model.dart';

class JobsService {
  final Dio dio = Dio();

  Future<List<Documents>?> getJobs() async {
    final response = await dio.get(UrlEnum.urlJobs.url);
    if (response.statusCode != 200) return List.empty();
    final jsonBody = JobsServiceModel.fromJson(response.data);
    return jsonBody.documents;
  }

//  final postData = {
//                                         'fields': {
//                                           'jobImage': {
//                                             'stringValue': 'URL_OF_JOB_IMAGE'
//                                           },
//                                           'jobTitle': {
//                                             'stringValue': 'Your Job Title'
//                                           },
//                                           'jobSubTitle': {
//                                             'stringValue': 'Your Job Subtitle'
//                                           },
//                                         },
//                                       };
  Future postJobs(Map<String, dynamic> postData) async {
    await dio.post(UrlEnum.urlJobs.url, data: postData);
  }

  Future patchJobs(
      {required Map<String, dynamic> patchData, required String url}) async {
    await dio.patch(url, data: patchData);
  }

  Future deleteJobs(String url) async {
    await dio.delete(url);
  }
}

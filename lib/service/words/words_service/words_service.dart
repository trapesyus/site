import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';

import '../words_model/words_model.dart';

class WordsService {
  final Dio _dio = Dio();

  Future getWords() async {
    log(UrlEnum.urlStrings.url);
    try {
      final Response request = await _dio.get(UrlEnum.urlStrings.url);
      log('burada buraya girdi');
      if (request.statusCode != 200 || request.data == null) return;
      final jsonBody = request.data;
      WordsServiceModel wordsServiceModel =
          WordsServiceModel.fromJson(jsonBody);
      log('${wordsServiceModel.opinionsContent!} buradan çıktı');
      return wordsServiceModel;
    } catch (e) {
      log('Hata Mesajı :$e');
    }
    // final Response request = await _dio.get(UrlEnum.getUrl.url);
    // log(request.data);
    // log(request.data);
    // log(request.data);
    //  if (request.statusCode != 200 || request.data == null) return;
    //  final jsonBody = request.data;
    //  WordsServiceModel wordsServiceModel = WordsServiceModel.fromJson(jsonBody);
    //  log(wordsServiceModel.aboutContent!);
    //  return wordsServiceModel;
  }

  Future<void> updateStrings({required Map<String, dynamic> updateWord}) async {
    await _dio.patch(UrlEnum.urlStrings.url, data: updateWord);
  }
}

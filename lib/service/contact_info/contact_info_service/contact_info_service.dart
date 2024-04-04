import 'package:dio/dio.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/service/contact_info/contact_info_model/contact_info_model.dart';

class ContactInfoService {
  final Dio _dio = Dio();

  Future<ContactInfoModel> getContactInfo() async {
    final Response response = await _dio.get(UrlEnum.urlContactInfo.url);
    if (response.statusCode != 200) {
      return ContactInfoModel();
    }
    final jsonBody = ContactInfoModel.fromJson(response.data);
    return jsonBody;
  }

  Future<void> patchInstagram({required String patchLink}) async {
    final data = {
      'instagram': patchLink,
    };
    await _dio.patch(UrlEnum.urlContactInfo.url, data: data);
  }

  Future<void> patchPhone({required String patchLink}) async {
    final data = {
      'phone': patchLink,
    };
    await _dio.patch(UrlEnum.urlContactInfo.url, data: data);
  }

  Future<void> patchFacebook({required String patchLink}) async {
    final data = {
      'facebook': patchLink,
    };
    await _dio.patch(UrlEnum.urlContactInfo.url, data: data);
  }

  Future<void> patchX({required String patchLink}) async {
    final data = {
      'x': patchLink,
    };
    await _dio.patch(UrlEnum.urlContactInfo.url, data: data);
  }

  Future<void> patchMail({required String patchLink}) async {
    final data = {
      'mail': patchLink,
    };
    await _dio.patch(UrlEnum.urlContactInfo.url, data: data);
  }

  Future<void> patchAdressLatitude({required double patchLatitude}) async {
    final data = {
      'latitude': patchLatitude,
    };
    await _dio.patch(
        'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/contactInfo/adress.json',
        data: data);
  }

  Future<void> patchAdressLongtitude({required double patchLongtitude}) async {
    final data = {
      'longtitude': patchLongtitude,
    };
    await _dio.patch(
        'https://eventopya-9e643-default-rtdb.europe-west1.firebasedatabase.app/contactInfo/adress.json',
        data: data);
  }
}

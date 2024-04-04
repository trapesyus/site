import 'package:mobx/mobx.dart';
import 'package:wedding_organise/service/service_screen/service_model/service_service_model.dart';

import '../../../service/service_screen/service_model/service_submodel/service_submodel/service_sub_model.dart';
import '../../../service/service_screen/service_service/service_service.dart';
import '../../../service/service_screen/service_service/service_subservice/service_sub_service.dart';

part 'services_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class ServicesScreenModel = _ServicesScreenModelBase with _$ServicesScreenModel;

abstract class _ServicesScreenModelBase with Store {
  @observable
  bool isLoading = false;
  @observable
  String imageLoadError =
      'https://w7.pngwing.com/pngs/319/145/png-transparent-404-universe-404-digital-universe.png';
  @observable
  String textLoadError = 'Bir Hata Oluştu';
  @observable
  String mainImage = '';

  @observable
  List<ServiceDocuments> items = ObservableList.of([]);
  @observable
  ServiceSubModel mainItems = ServiceSubModel();
  final ServiceSubService _serviceSubService = ServiceSubService();
  final ServiceService _serviceService = ServiceService();
  @action
  Future<void> initialize() async {
    await getScreenItems().whenComplete(() => isLoading = true);
  }

  Future<void> getScreenItems() async {
    items = (await _serviceService.getServiceScreenItems())!;
    mainItems = (await _serviceSubService.getServicesScreenMainImageText())!;
  }
}

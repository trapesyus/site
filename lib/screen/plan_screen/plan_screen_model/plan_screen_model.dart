import 'package:mobx/mobx.dart';
import 'package:wedding_organise/service/plan/plan_model/plan_service_model.dart';
import 'package:wedding_organise/service/plan/plan_model/plan_submodel/plan_sub_model.dart';
import 'package:wedding_organise/service/plan/plan_service/plan_service.dart';
import 'package:wedding_organise/service/plan/plan_service/plan_sub_service/plan_sub_service.dart';
part 'plan_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class PlanScreenModel = _PlanScreenModelBase with _$PlanScreenModel;

abstract class _PlanScreenModelBase with Store {
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
  List<PlanDocuments> items = ObservableList.of([]);
  @observable
  PlanSubModel mainItems = PlanSubModel();
  final PlanSubService _planSubService = PlanSubService();
  final PlanService _planService = PlanService();
  @action
  Future<void> initialize() async {
    await getScreenItems().whenComplete(() => isLoading = true);
  }

  Future<void> getScreenItems() async {
    items = (await _planService.getPlanScreenItems())!;
    mainItems = (await _planSubService.getPlanScreenMainImageText())!;
  }
}

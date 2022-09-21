import 'package:get/get.dart';
import 'package:payment_app/services/data_services.dart';

class DataController extends GetxController {
  var list = [].obs;

  final service = DataServices();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() {
    var info = service.getUsers();
    list.addAll(info);
  }
}

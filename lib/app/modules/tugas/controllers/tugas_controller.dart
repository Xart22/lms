import 'package:get/get.dart';

import '../../../data/home_response_model.dart';
import '../../../data/tugas_response_model.dart';
import '../../../service/api/tugas_provider.dart';

class TugasController extends GetxController {
  var listTugas = <Tugas>[].obs;
  Assignment? assignment = Get.arguments;

  getTugas() async {
    var data = await TugasProvider.getTugas();
    if (data != null) {
      listTugas.value = data.data!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTugas();
  }
}

import 'package:get/get.dart';
import 'package:getx_improvement/base_state.dart';

class ContohController extends GetxController {
  RxString variableA = ''.obs;
  RxBool varibaleAIsLoading = false.obs;

  void setVaribaleA() async {
    varibaleAIsLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        variableA.value = 'Berhasil';
        varibaleAIsLoading.value = false;
      },
    );
  }

  Rx<BaseState<String>> variableRevampA = BaseState<String>().obs;

  Future setVaribaleExample() async {
    variableRevampA.value =
        variableRevampA.value.copyWith(status: StatusState.loading);
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        try {
          // throw Exception();
          variableRevampA.value = variableRevampA.value.copyWith(
            status: StatusState.success,
            data: 'Berhasil Example',
          );
        } catch (e) {
          variableRevampA.value = variableRevampA.value.copyWith(
            status: StatusState.error,
            message: e.toString(),
          );
        }
      },
    );
  }
}

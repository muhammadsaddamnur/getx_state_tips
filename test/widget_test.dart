import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_improvement/base_state.dart';
import 'package:getx_improvement/contoh_controller.dart';

void main() {
  final ContohController controller = Get.put(ContohController());

  test('Getx Test', () async {
    List<BaseState<String>> result = [];
    List<BaseState<String>> expectedResult = [
      BaseState(),
      BaseState(status: StatusState.loading),
      BaseState(status: StatusState.success, data: 'Berhasil Example'),
    ];

    ever(
      controller.variableRevampA,
      (callback) {
        result.add(callback);
      },
    );

    // init data variableRevampA
    controller.variableRevampA.value = controller.variableRevampA.value;

    // jalankan method setVaribaleExample()
    await controller.setVaribaleExample();

    for (var i = 0; i < result.length; i++) {
      expect(result[i].status, expectedResult[i].status);
      expect(result[i].data, expectedResult[i].data);
      expect(result[i].message, expectedResult[i].message);
    }
  });
}

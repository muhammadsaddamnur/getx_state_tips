import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_improvement/base_state.dart';
import 'package:getx_improvement/contoh_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final ContohController controller = Get.put(ContohController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => controller.varibaleAIsLoading.value
                  ? const CircularProgressIndicator()
                  : Text(controller.variableA.value),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setVaribaleA();
              },
              child: const Text('Update'),
            ),
            Obx(
              () {
                switch (controller.variableRevampA.value.status) {
                  case StatusState.initial:
                    return const SizedBox();
                  case StatusState.loading:
                    return const CircularProgressIndicator();
                  case StatusState.success:
                    return Text(controller.variableRevampA.value.data ?? '');
                  case StatusState.error:
                    return Text(
                      controller.variableRevampA.value.message,
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.setVaribaleExample();
              },
              child: const Text('Update Example'),
            )
          ],
        ),
      ),
    );
  }
}

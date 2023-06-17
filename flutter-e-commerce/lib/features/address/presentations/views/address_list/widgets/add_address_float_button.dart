import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_controller.dart';
import 'package:get/get.dart';

class AddAddressFloatButton extends StatelessWidget {
  const AddAddressFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller = Get.put(AddressControllerImp());

    return FloatingActionButton(
      onPressed: (){
        controller.goToCreateScreen();
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}

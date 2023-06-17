import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_create/widgets/continue_button.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_create/widgets/select_location.dart';
import 'package:get/get.dart';

class AddressCreateScreen extends StatelessWidget {
  const AddressCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Addresses Create'.tr,
        ),
      ),
      backgroundColor: const Color(0XffEEeeEE),

      body: const Stack(
        children: [
          SelectLocation(),
          ContinueButton(),
        ],
      ),
    );
  }
}



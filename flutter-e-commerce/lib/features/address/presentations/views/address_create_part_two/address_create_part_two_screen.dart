import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_create_part_two/widgets/address_create_fields.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_create_part_two/widgets/address_save_button.dart';
import 'package:get/get.dart';

class AddressCreatePartTwoScreen extends StatelessWidget {
  const AddressCreatePartTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Addresses Create'.tr,
        ),
      ),
      backgroundColor: const Color(0XffEEeeEE),
      bottomNavigationBar: const AddressSaveButton(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: AddressCreateFields(),
        ),
      ),
    );
  }
}


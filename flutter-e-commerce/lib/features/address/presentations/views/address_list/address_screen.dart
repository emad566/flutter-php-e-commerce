import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_list/widgets/add_address_float_button.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_list/widgets/address_list_view.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Addresses'.tr,
        ),
      ),
      backgroundColor: const Color(0XffEEeeEE),
      floatingActionButton: const AddAddressFloatButton(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: AddressListView(),
      ),
    );
  }
}



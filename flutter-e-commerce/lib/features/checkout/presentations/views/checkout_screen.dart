import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/core/shared/widgets/section_title.dart';
import 'package:flutter_e_commerce/features/address/data/models/address_list_model/address_model.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_controller.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/view_models/controllers/checkout_controller.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/views/widgets/select_delivery_type.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/views/widgets/select_payment_type.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controllerCheck = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'.tr),
      ),
      bottomNavigationBar: ButtonBottomNav(
        title: 'Confirm'.tr,
        onPress: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<CheckoutControllerImp>(
            init: CheckoutControllerImp(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectPaymentType(),
                  SelectDeliveryType(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: AppLangKeys.shippingAddress.tr),
                      GetBuilder<AddressControllerImp>(
                        init: AddressControllerImp(),
                        builder: (controller) {
                          return HandleLoading(
                            state: controller.state,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.listData.length,
                              itemBuilder: (context, index){
                                AddressModel item = controller.listData[index];
                                return InkWell(
                                  onTap: ()=>controllerCheck.setAddressId(index),
                                  child: Card(
                                    color: controllerCheck.addressId == index
                                        ? ThemeColors.secondClr
                                        : ThemeColors.white,
                                    margin: EdgeInsets.all(10),
                                    elevation: 10,

                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.addressName,
                                                style: AppStyles.style14Bold.copyWith(color:  controllerCheck.addressId == index? ThemeColors.white : ThemeColors.primaryClr),
                                              ),
                                              Text(
                                                item.addressCity,
                                                style: AppStyles.style14Bold.copyWith(color:  controllerCheck.addressId == index? ThemeColors.white : ThemeColors.primaryClr),
                                              ),
                                              Text(
                                                item.addressStreet,
                                                style: AppStyles.style14Bold.copyWith(color:  controllerCheck.addressId == index? ThemeColors.white : ThemeColors.primaryClr),
                                              ),
                                            ],
                                          ),
                                          if(controllerCheck.addressId == index)
                                          Positioned(
                                            top: 5,
                                            left: 5,
                                            child:  Icon(Icons.check_circle_outline, size: 30, color: ThemeColors.white,),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


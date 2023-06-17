import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/core/shared/widgets/section_title.dart';
import 'package:flutter_e_commerce/features/address/data/models/address_list_model/address_model.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_controller.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/view_models/controllers/checkout_controller.dart';
import 'package:get/get.dart';

class SelectAddress extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SelectAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controllerCheck = Get.put(CheckoutControllerImp());
    return Column(
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.listData.length,
                itemBuilder: (context, index){
                  AddressModel item = controller.listData[index];
                  return InkWell(
                    onTap: ()=>controllerCheck.setAddressId(index),
                    child: Card(
                      color: controllerCheck.addressId == index
                          ? ThemeColors.secondClr
                          : ThemeColors.white,
                      margin: const EdgeInsets.all(10),
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
                                  style: AppStyles.style18Bold.copyWith(color:  controllerCheck.addressId == index? ThemeColors.white : ThemeColors.primaryClr),
                                ),
                                Text(
                                  item.addressCity,
                                  style: AppStyles.style16Bold.copyWith(color:  controllerCheck.addressId == index? ThemeColors.white : ThemeColors.primaryClr),
                                ),
                                Text(
                                  item.addressStreet,
                                  style: AppStyles.style16Bold.copyWith(color:  controllerCheck.addressId == index? ThemeColors.white : ThemeColors.primaryClr),
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
    );
  }
}

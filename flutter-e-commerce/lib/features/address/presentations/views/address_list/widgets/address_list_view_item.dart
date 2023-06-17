import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/address/data/models/address_list_model/address_model.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_controller.dart';
import 'package:get/get.dart';

class AddressListViewItem extends StatelessWidget {
  const AddressListViewItem({
    super.key,
    required this.item,
  });

  final AddressModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.addressName,
                style: AppStyles.style20Bold
                    .copyWith(color: ThemeColors.primaryClr),
              ),
              Text(
                item.addressCity,
                style: AppStyles.style18Bold
                    .copyWith(color: ThemeColors.black.withOpacity(.8)),
              ),
              Text(
                item.addressStreet,
                style: AppStyles.style16Bold
                    .copyWith(color: ThemeColors.black.withOpacity(.5)),
              ),
            ],
          ),
        ),
        Expanded(
          child: GetBuilder<AddressControllerImp>(
            init: AddressControllerImp(),
            builder: (controller) {
              return HandleLoading(
                state: controller.state,
                loadingLevel: int.parse(item.addressId.toString()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: ()=>controller.delete(item.addressId),
                      icon: Icon(Icons.delete_forever, size: 30,
                        color: ThemeColors.primaryClr,),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

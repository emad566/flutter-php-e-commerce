import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_controller.dart';
import 'package:flutter_e_commerce/features/address/presentations/views/address_list/widgets/address_list_view_item.dart';
import 'package:get/get.dart';

class AddressListView extends StatelessWidget {
  const AddressListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressControllerImp>(
      init: AddressControllerImp(),
      builder: (controller){
        return HandleLoading(
          state: controller.state,
          child: ListView.separated(
            itemCount: controller.listData.length,
            itemBuilder: (context, index){
              return AddressListViewItem(item: controller.listData[index]);
            },
            separatorBuilder: (context, index){
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                height: 2,
                color: ThemeColors.thirdClr,
              );
            },

          ),
        );
      },
    );
  }
}

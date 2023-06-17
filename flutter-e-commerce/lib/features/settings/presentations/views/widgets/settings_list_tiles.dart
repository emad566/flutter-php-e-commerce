import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/settings/presentations/view_models/controllers/settings_controller.dart';
import 'package:get/get.dart';

class SettingsListTiles extends StatelessWidget {
  const SettingsListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: ThemeColors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Disable Notifications'.tr,
              style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
            ),
            trailing: Switch(
              activeColor: ThemeColors.primaryClr,
              onChanged: (val){

              },
              value: false,
            ),
            onTap: (){},
          ),
          ListTile(
            title: Text(
              'Address'.tr,
              style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
            ),
            trailing: Icon(Icons.location_on_outlined, size: 35, color: ThemeColors.primaryClr,),
            onTap: ()=>controller.goToAddress(),
          ),
          ListTile(
            title: Text(
              'About Us'.tr,
              style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
            ),
            trailing: Icon(Icons.help_outline, size: 35, color: ThemeColors.primaryClr,),
            onTap: (){},
          ),
          ListTile(
            title: Text(
              'Contact Us'.tr,
              style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
            ),
            trailing: Icon(Icons.phone_callback_outlined, size: 35, color: ThemeColors.primaryClr,),
            onTap: (){},
          ),
          ListTile(
            title: Text(
              'Log out'.tr,
              style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
            ),
            trailing: Icon(Icons.exit_to_app, size: 35, color: ThemeColors.primaryClr,),
            onTap: ()=>controller.logOut(),
          ),
        ],
      ),
    );
  }
}

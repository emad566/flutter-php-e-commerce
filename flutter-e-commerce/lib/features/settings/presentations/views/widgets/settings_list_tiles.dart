import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/settings/presentations/view_models/controllers/settings_controller.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/widgets/settings_lis_tile_item.dart';
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
              style:
                  AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
            ),
            trailing: Switch(
              activeColor: ThemeColors.primaryClr,
              onChanged: (val) {},
              value: false,
            ),
            onTap: () {},
          ),
          SettingsLisTileItem(
            title: AppLangKeys.orders.tr,
            iconData: Icons.card_travel,
            onTap: () => controller.goToOrders(),
          ),
          SettingsLisTileItem(
            title: 'Address'.tr,
            iconData: Icons.location_on_outlined,
            onTap: () => controller.goToAddress(),
          ),
          SettingsLisTileItem(
            title: 'About Us'.tr,
            iconData: Icons.help_outline,
            onTap: () {},
          ),
          SettingsLisTileItem(
            title: 'Contact Us'.tr,
            iconData: Icons.phone_callback_outlined,
            onTap: () {},
          ),
          SettingsLisTileItem(
            title: 'Log out'.tr,
            iconData: Icons.exit_to_app,
            onTap: () => controller.logOut(),
          ),
        ],
      ),
    );
  }
}

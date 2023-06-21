import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/widgets/settings_header.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/widgets/settings_list_tiles.dart';
import 'package:get/get.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppLangKeys.settings.tr),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SettingsHeader(),
            SettingsListTiles(),
          ],
        ),
      ),
    );
  }
}





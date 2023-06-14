import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/widgets/settings_header.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/widgets/settings_list_tiles.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SettingsHeader(),
          SettingsListTiles(),
        ],
      ),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/notifications/data/models/notification_model.dart';
import 'package:flutter_e_commerce/features/notifications/presentations/view_models/controllers/notifications_controller.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppLangKeys.notificationsList.tr),
      body: GetBuilder<NotificationsControllerImp>(
        init: NotificationsControllerImp(),
        builder: (controller){
          return HandleLoading(
            state: controller.state,
            child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index){
                NotificationModel item = controller.items[index];
              return ListTile(
                  title: Text(
                    item.notificationTitle,
                    style: AppStyles.style18Bold.copyWith(
                      color: ThemeColors.black
                    ),
                  ),
                  subtitle: Text(
                    item.notificationBody,
                    style: AppStyles.style16Bold.copyWith(
                      color: ThemeColors.tripleText
                    ),
                  ),
                  trailing: Text(
                    Jiffy.parse(item.notificationCreatedAt.toString()).fromNow(),
                    style: AppStyles.style14Bold.copyWith(
                        color: ThemeColors.tripleText
                    ),
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}




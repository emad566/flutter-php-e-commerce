import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/circle_image.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_controller.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';


// show the dialog
void showRatingDialog(OrderModel item) {
  showDialog(
    context: Get.context!,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title: Text(
        AppLangKeys.ratingDialog.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        AppLangKeys.tapStarToSetYourRatingAddMoreDescriptionHereIfYouWant.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
      image: CircleImage(radius: 100, path: AppPaths.logo),
      submitButtonText: AppLangKeys.submit.tr,
      commentHint: AppLangKeys.typeCommentHere.tr,
      onCancelled: () {},
      onSubmitted: (response) {
        OrdersControllerImp controller = Get.put(OrdersControllerImp());
        controller.storeRate(item.ordersId.toString(), response.rating.toString(), response.comment);
      },
    ),
  );
}


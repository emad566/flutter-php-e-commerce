import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/notifications/data/models/notification_model.dart';
import 'package:flutter_e_commerce/features/notifications/data/models/notifications_list_model.dart';
import 'package:flutter_e_commerce/features/notifications/data/repos/notifications_repo.dart';
import 'package:get/get.dart';

abstract class NotificationsController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  List<NotificationModel> items= [];
  void list();
  final NotificationsRepoImp _repoImp = NotificationsRepoImp(Get.find());
}

class NotificationsControllerImp extends NotificationsController{


  @override
  void list() async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.list({'usersid': loginCached.usersId});
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        items = NotificationsListModel.fromJson(response).data;
        state = AppSuccessState();
        update();
      }
    });
  }


  @override
  void onInit() {
    super.onInit();
    list();
  }
}
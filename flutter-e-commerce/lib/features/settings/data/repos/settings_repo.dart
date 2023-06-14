import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class SettingsRepo {
  ApiService apiService;
  SettingsRepo(this.apiService);

}

class SettingsRepoImp extends SettingsRepo {
  SettingsRepoImp(super.apiService);

}

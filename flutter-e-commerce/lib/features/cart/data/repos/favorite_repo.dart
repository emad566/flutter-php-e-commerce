import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class CartRepo {
  ApiService apiService;
  CartRepo(this.apiService);

}

class CartRepoImp extends CartRepo {
  CartRepoImp(super.apiService);
}

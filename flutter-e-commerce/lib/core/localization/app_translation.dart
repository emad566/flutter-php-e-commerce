import 'package:flutter_e_commerce/core/localization/ar_tr.dart';
import 'package:flutter_e_commerce/core/localization/en_tr.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": arTr,
        "en": enTr,
      };
}

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/check_email_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/auth_logo.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// ignore: must_be_immutable
class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailController controller =
        Get.put(CheckEmailControllerImp(Get.find()));

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          'Check Code'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: ThemeColors.secondaryText),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const AuthLogo(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Please Enter the digit code sent to emad@gmail.com'.tr,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ThemeColors.secondClr,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: ThemeColors.secondClr,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  controller.checkEmail(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CheckEmailControllerImp>(
                init: CheckEmailControllerImp(Get.find()),
                builder: (controller) {
                  return HandleLoading(
                    state: controller.state,
                    child: InkWell(
                      onTap: () {
                        controller.resendCode();
                      },
                      child: Text(
                        'Resend verification code'.tr,
                        style: AppStyles.style18Bold
                            .copyWith(color: ThemeColors.thirdClr),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

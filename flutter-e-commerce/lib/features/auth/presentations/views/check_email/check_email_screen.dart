import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/check_email_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/auth_logo.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


// ignore: must_be_immutable
class CheckEmailScreen extends StatelessWidget {
  CheckEmailScreen({Key? key}) : super(key: key);
  GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    CheckEmailController controller = Get.put(CheckEmailControllerImp());

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          'Check Code'.tr,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: ThemeColors.secondaryText
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const AuthLogo(),
                const SizedBox(height: 30,),
                Text(
                  'Please Enter the digit code sent to emad@gmail.com'.tr,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeColors.secondClr,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: ThemeColors.secondClr,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    controller.checkEmail();
                  }, // end onSubmit
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






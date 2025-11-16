import 'dart:async';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/app_logo.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/centered_circular_progress.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/snack_bar_message.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/verify_otp_controller.dart';
import 'package:e_commerce_app/features/shared/screens/bottom_nav_holder_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/controller/auth_controller.dart';
import '../../../../core/models/verify_otp_request_model.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  static const String name = '/verify-otp';

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  final VerifyOtpController _verifyOtpController =
      Get.find<VerifyOtpController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 48),
                AppLogo(width: 100),
                const SizedBox(height: 24),
                Text('Verify OTP', style: textTheme.titleLarge),
                Text(
                  'A 4 digits OTP has been sent to your email address',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(shape: PinCodeFieldShape.box),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  appContext: context,
                  controller: _otpTEController,
                ),
                const SizedBox(height: 16),
                GetBuilder<VerifyOtpController>(builder: (controller) {
                  return Visibility(
                    visible: controller.verifyOtpInProgress == false,
                    replacement: CenteredCircularProgress(),
                    child: FilledButton(
                      onPressed: _onTapVerifyButton,
                      child: Text('Verify'),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _onTapBackToLoginButton,
                  child: Text('Back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyButton() {
    // TODO: Validate form
    _verifyOtp();
  }

  Future<void> _verifyOtp() async {
    VerifyOtpRequestModel model =
        VerifyOtpRequestModel(email: widget.email, otp: _otpTEController.text);
    final bool isSuccess = await _verifyOtpController.verifyOtp(model);
    if (isSuccess) {
      await Get.find<AuthController>().saveUserData(
          _verifyOtpController.userModel!, _verifyOtpController.accessToken!);
      Navigator.pushNamedAndRemoveUntil(
          context, BottomNavHolderScreen.name, (predicate) => false);
    } else {
      showSnackBarMessage(context, _verifyOtpController.errorMessage!);
    }
  }

  void _onTapBackToLoginButton() {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (p) => false);
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}

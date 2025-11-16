class VerifyOtpRequestModel {
  final String email;
  final String otp;

  VerifyOtpRequestModel({required this.email, required this.otp});
  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "otp": otp // static
    };
  }
}

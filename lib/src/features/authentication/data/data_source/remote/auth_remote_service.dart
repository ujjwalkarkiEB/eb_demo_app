abstract class AuthApiService {
  Future<String> signInUser({required String email, required String password});
  Future<void> signUpUser({required String email, required String password});
  Future<void> refreshToken({required String refreshToken});
  Future<void> logout();
  Future<void> logoutFromAllDevices();
  Future<void> changePassword(
      {required String oldPassword, required String newPassword});
  Future<void> resetPasswordEmail({required String email});
  Future<void> resetPassword(
      {required String token, required String newPassword});
  Future<void> verifyAuthenticatorOtp({required String otp});
  Future<void> verifyOtp({required String otp});
  Future<void> resendOtp({required String email});
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isPasswordVisible = false.obs;
  var isResendButtonEnabled = true.obs;
  var resendButtonCountdown = 60.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<bool> registerFC(String name, String email, String password, String phone) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);
      await sendVerificationEmail();
      return true;
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        Get.snackbar("Email Verification", "Verification email has been sent to ${user.email}");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> resendVerificationEmail() async {
    await sendVerificationEmail();
    startResendEmailTimer();
  }

  void startResendEmailTimer() {
    isResendButtonEnabled.value = false;
    resendButtonCountdown.value = 60;
    Future.delayed(Duration(seconds: 1), () {
      if (resendButtonCountdown.value > 0) {
        resendButtonCountdown.value--;
        startResendEmailTimer();
      } else {
        isResendButtonEnabled.value = true;
      }
    });
  }

  Future<bool> loginFC(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        Get.snackbar("Email belum diverifikasi", "Silakan verifikasi email Anda terlebih dahulu.");
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Reset Password", "Email untuk mengatur ulang kata sandi telah dikirim ke $email.");
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logoutFC() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/halaman_login'); // Navigasi ke halaman login setelah logout
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

    User? getCurrentUser() {
    return _auth.currentUser;
  }
}

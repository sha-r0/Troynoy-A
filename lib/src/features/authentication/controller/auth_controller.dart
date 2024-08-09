import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/src/features/authentication/view/login/login_screen.dart';
import 'package:first/src/features/home/view/home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable to track user authentication status
  var isLoggedIn = false.obs;
  var user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize authentication state
    _auth.authStateChanges().listen((User? firebaseUser) {
      user.value = firebaseUser;
      print(user.value!.email);
      isLoggedIn.value = firebaseUser != null;
      // Navigate based on authentication status
      if (isLoggedIn.value) {
        Get.offAll(() => HomeScreen()); // Navigate to Home screen
      } else {
        Get.offAll(() => LoginScreen()); // Navigate to Login screen
      }
    });
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user.value = userCredential.user;
      isLoggedIn.value = true;
      // Navigate to HomeScreen on successful login
      Get.offAll(() => HomeScreen());
    } catch (e) {
      String errorMessage = 'An error occurred. Please try again.';

      if (e is FirebaseAuthException) {
        // Print the exception to the console for debugging
        print('FirebaseAuthException: ${e.message}');

        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'user-not-found':
            errorMessage = 'No user found with this email.';
            break;
          case 'wrong-password':
            errorMessage = 'Incorrect password.';
            break;
          case 'network-request-failed':
            errorMessage = 'Network error. Please check your connection.';
            break;
          case 'user-disabled':
            errorMessage = 'The user account has been disabled.';
            break;
          default:
            errorMessage = 'An unexpected error occurred: ${e.message}';
        }
      } else {
        // Log other types of exceptions
        print('Unknown Exception: ${e.toString()}');
      }

      // Show an error message using GetX
      Get.snackbar('Login Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      user.value = null;
      isLoggedIn.value = false;
      // Navigate to Login screen on logout
      Get.offAll(() => LoginScreen());
    } catch (e) {
      // Handle logout errors
      Get.snackbar('Logout Error', 'An error occurred while logging out.', snackPosition: SnackPosition.BOTTOM);
    }
  }

  bool get isUserLoggedIn => isLoggedIn.value;
}

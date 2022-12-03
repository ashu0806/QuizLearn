import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';
import 'package:quiz_learn/core/widgets/dialogs/dialogue_widget.dart';
import 'package:quiz_learn/pages/home/home_page.dart';
import 'package:quiz_learn/pages/login/login_page.dart';

class AuthController extends GetxController {
  late FirebaseAuth auth;
  final _user = Rxn<User>();

  late Stream<User?> authStateChanges;

  @override
  void onReady() {
    super.onReady();
    initAuth();
  }

  void initAuth() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    auth = FirebaseAuth.instance;
    authStateChanges = auth.authStateChanges();
    authStateChanges.listen(
      (User? user) {
        _user.value = user;
      },
    );
    navigateToOnboarding();
  }

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final authAccount = await googleSignInAccount.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );
        await auth.signInWithCredential(credential);
        await saveUser(googleSignInAccount);
        navigateToHomePage();
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
  }

  User? getUser() {
    _user.value = auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRefrence.doc(account.email).set(
      {
        'email': account.email,
        'name': account.displayName,
        'profilePic': account.photoUrl,
      },
    );
  }

  Future<void> signOut() async {
    Fluttertoast.showToast(
      msg: "Sign Out",
    );
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
  }

  void navigateToOnboarding() {
    Get.offAllNamed('/onboarding');
  }

  void navigateToHomePage() {
    Get.offAllNamed(
      HomePage.routeName,
    );
  }

  void navigateToLogInPage() {
    Get.toNamed(
      LogInPage.routeName,
    );
  }

  void showLogInAlertDialogue() {
    Get.dialog(
      Dialogs.quizStartDialogue(
        onTap: () {
          Get.back();
          navigateToLogInPage();
        },
      ),
      barrierDismissible: false,
    );
  }

  bool isLogged() {
    return auth.currentUser != null;
  }
}

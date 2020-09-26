import 'package:SutasPersonel/core/init/services/login_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';

abstract class LoginScreenViewModel extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Add your state and logic here

  String email_valid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email)) {
      //regex içinde olan değerler olmadığında içeri girip ifadeyi return olarak döndürür.
      return "Geçersiz e-mail";
    } else {
      return null;
    }
  }

  String passValid(String pass) {
    if (pass.length < 6) {
      return "Lütfen 6 karakterden fazla bir şifre değeri giriniz";
    }
  }

  void forgotOnpres() {
    Navigator.of(context).pushNamedAndRemoveUntil('/forgot_password',
        (Route<dynamic> route) => false); // will add forgotOnPress route
  }

  loginOnpress(BuildContext context) async {
    formkey.currentState.validate();
    var resultUser = await SignInHelper.instance()
        .signIn(emailController.text, passwordController.text);
    print(resultUser.emailVerified);
    if (resultUser.emailVerified) {
      print("email onaylı kullanıcı giriş yapıyor");
      print("uid ${resultUser.uid}");
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/bottom_navigation', (Route<dynamic> route) => false);
      // Navigator;
    } else {
      print("denemee");
      scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
              "E-mail adresinize aktivasyon maili gönderdik lüfen onaylayın")));
      resultUser.sendEmailVerification();
      auth.signOut();
    }
  }

  onPressRegister() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/register', (Route<dynamic> route) => false);
    //// will add forgotOnPress route
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

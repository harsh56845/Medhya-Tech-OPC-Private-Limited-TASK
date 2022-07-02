import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nish_hair/pages/sign_in.dart';

import '../pages/home.dart';

class Auth extends ChangeNotifier {
  bool e = false;
  bool e2 = false;
  final auth = FirebaseAuth.instance;

  signUser(_emailController, _passwordController, context) async {
    bool check = true;
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      check = false;
    }

    bool isValid = EmailValidator.validate(_emailController.text);
    if (isValid == false && _emailController.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "enter a vaild email Id");
    }

    if (check == true && isValid == true) {
      try {
        await auth
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((_) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Home()));
        });
        Fluttertoast.showToast(msg: "You are sucessfully loggedIn");
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  creatuser(_emailController, _passwordController, _confirmPasswordController) {
    bool pass = true;
    bool check = true;
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      check = false;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      Fluttertoast.showToast(msg: "comfirm password didn't match");
      pass = false;
    }

    bool isValid = EmailValidator.validate(_emailController.text);
    if (isValid == false && _emailController.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "enter a vaild email Id");
    }

    if (check == true && pass == true && isValid == true) {
      auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      _emailController.text = '';
      _passwordController.text = '';
      _confirmPasswordController.text = '';

      Fluttertoast.showToast(msg: "Your account has been Created");
    }
  }

  signOut(context) {
    auth.signOut().then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
    });
    Fluttertoast.showToast(msg: "You are sucessfully logOut");
  }

  void eye() {
    e = !e;
    notifyListeners();
  }

  void eye2() {
    e2 = !e2;
    notifyListeners();
  }
}

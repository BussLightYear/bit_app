import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bit_app/view/widgets/warning_dialog.dart' as WarnDial;

void initialize() async {
  await Firebase.initializeApp();
}

void stateFirebase(context) async {
  FirebaseAuth.instance.authStateChanges().listen((User user) async {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');

      if (!user.emailVerified) {
        await user.sendEmailVerification();
        WarnDial.showWarningDialog(
            context: context,
            message:
                'A verification email has been sent to your email. Please verify and try to log in again.');
      } else {
        Navigator.pushReplacementNamed(context, './news');
      }
    }
  });
}

void signIn({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      WarnDial.showWarningDialog(
          context: context, message: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      WarnDial.showWarningDialog(
          context: context, message: 'Wrong password provided for that user.');
    }
  }
}

void signOut({@required context}) async {
  await FirebaseAuth.instance.signOut();
  //Not working correctly. The last view is not being removed form the navigator stack
  //I guess I'll have to use global keys for contexts references.
  Navigator.pushReplacementNamed(context, './login');
}

void userRegistration(
    {@required String email,
    @required String password,
    @required context}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) => new AlertDialog(
              title: Text("Warning!"),
              content: Text('Registration succesfull!.'),
              // actions: <Widget>[
              //   FlatButton(
              //     child: Text('Close me!'),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //       // Navigator.pop(context);
              //     },
              //   )
              // ],
            ));
    // WarnDial.showWarningDialog(
    //     context: context, message: 'Registration succesfull!.');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      WarnDial.showWarningDialog(
          context: context, message: 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      WarnDial.showWarningDialog(
          context: context, message: 'Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
}

void sendPasswordRecover({@required String email, @required context}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    WarnDial.showWarningDialog(
        context: context,
        message:
            'An email has been sent to the email provided. Make sure to check SPAM folder.');
  } on FirebaseAuthException catch (e) {
    WarnDial.showWarningDialog(
        context: context,
        message: 'Please verify the information provided and try again.');
  } catch (e) {
    print(e);
  }
}

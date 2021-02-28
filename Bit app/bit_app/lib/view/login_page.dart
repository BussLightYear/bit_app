import 'package:flutter/material.dart';

import 'package:bit_app/utils/firebaseController.dart' as AuthController;
import 'package:google_fonts/google_fonts.dart';
import 'package:bit_app/view/widgets/warning_dialog.dart' as WarnDial;
import 'dialog_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    AuthController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _BackImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: _LogInfo(),
                ),
                _SignUpInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackImage extends StatelessWidget {
  _BackImage();

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;

    return Positioned(
      top: 0,
      left: 0,
      height: _altura,
      width: _ancho,
      child: Container(
        height: _altura,
        width: _ancho,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: AssetImage('assets/img/bitback.jpg'),
          ),
        ),
      ),
    );
  }
}

class _LogInfo extends StatefulWidget {
  _LogInfo();

  @override
  __LogInfoState createState() => __LogInfoState();
}

class __LogInfoState extends State<_LogInfo> {
  TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  bool eyePass = false;
  bool LogButtonStatus = false;

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: 60,
        left: 25,
        right: 25,
      ),
      width: (_ancho),
      height: (_altura) * 2 / 3,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            spreadRadius: _altura * 0.007,
            blurRadius: _altura * 0.009,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to',
            style: GoogleFonts.signika(
              color: Color(0xff444a4d),
              fontWeight: FontWeight.bold,
              fontSize: _ancho * 0.05,
            ),
          ),
          SizedBox(
            height: _altura * 0.01,
          ),
          SizedBox(
            // height: _altura * 0.1,
            width: _ancho * 0.45,
            child: Align(
              alignment: Alignment.topLeft,
              child: ColorFiltered(
                child: Image.asset('assets/img/bit.png'),
                colorFilter:
                    ColorFilter.mode(Color(0xff444a4d), BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(
            height: _altura * 0.01,
          ),
          Text(
            'Please log in to continue',
            style: GoogleFonts.signika(
              color: Color(0xff444a4d),
              fontWeight: FontWeight.bold,
              fontSize: _ancho * 0.05,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: _altura * 0.07,
                right: _ancho * 0.1,
                left: _ancho * 0.1,
              ),
              child: Material(
                elevation: 7.0,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: _textEditingControllerEmail,
                  enableSuggestions: false,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                      // color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: _altura * 0.02,
                right: _ancho * 0.1,
                left: _ancho * 0.1,
              ),
              child: Material(
                elevation: 7.0,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: _textEditingControllerPassword,
                  cursorColor: Colors.black,
                  obscureText: eyePass == false ? true : false,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        // color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(eyePass == false
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(() {
                            eyePass = !eyePass;
                          });
                        },
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: _ancho * 0.06),
            child: Align(
              alignment: Alignment.topRight,
              child: FlatButton(
                onPressed: () {
                  if (_textEditingControllerEmail.text.isEmpty) {
                    WarnDial.showWarningDialog(
                        context: context,
                        message:
                            'Please verify the information provided and try again.');
                  } else {
                    AuthController.sendPasswordRecover(
                      email: _textEditingControllerEmail.text,
                      context: context,
                    );
                  }
                },
                child: Text(
                  'forgot password?',
                  style: GoogleFonts.signika(
                    color: Color(0xff444a4d),
                    fontWeight: FontWeight.bold,
                    fontSize: _ancho * 0.038,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _altura * 0.05),
            child: Center(
              child: SizedBox(
                width: _ancho * 0.6,
                height: _altura * 0.06,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    side: BorderSide(color: Colors.grey),
                  ),
                  color: Colors.white,
                  child: Text(
                    'LOG IN',
                    style: GoogleFonts.signika(
                      color: Color(0xff444a4d),
                      fontWeight: FontWeight.bold,
                      fontSize: _ancho * 0.05,
                    ),
                  ),
                  // LogButtonStatus != true
                  //     ? Text(
                  //         'LOG IN',
                  //         style: GoogleFonts.signika(
                  //           color: Color(0xff444a4d),
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: _ancho * 0.05,
                  //         ),
                  //       )
                  //     : CircularProgressIndicator(),
                  onPressed: () {
                    setState(() {
                      // LogButtonStatus = !LogButtonStatus;
                      if (_textEditingControllerEmail.text.isEmpty ||
                          _textEditingControllerPassword.text.isEmpty) {
                        WarnDial.showWarningDialog(
                            context: context,
                            message:
                                'Please complete all fields before continuing.');
                        // LogButtonStatus = !LogButtonStatus;
                      } else {
                        // LogButtonStatus = !LogButtonStatus;
                        AuthController.signIn(
                          email: _textEditingControllerEmail.text,
                          password: _textEditingControllerPassword.text,
                          context: context,
                        );
                        AuthController.stateFirebase(context);
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpInfo extends StatelessWidget {
  _SignUpInfo();

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    return Container(
      width: (_ancho),
      height: (_altura) * 1 / 3,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: _altura * 0.06,
            ),
            child: Text(
              'OR',
              style: GoogleFonts.signika(
                color: Color(0xff444a4d),
                fontWeight: FontWeight.bold,
                fontSize: _ancho * 0.08,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: _altura * 0.08,
            ),
            child: SizedBox(
              width: _ancho * 0.6,
              height: _altura * 0.06,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                  side: BorderSide(color: Colors.grey),
                ),
                color: Colors.white,
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.signika(
                    color: Color(0xff444a4d),
                    fontWeight: FontWeight.bold,
                    fontSize: _ancho * 0.05,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, './registration');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

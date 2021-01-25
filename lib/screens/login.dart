import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roomcontrol/screens/home.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginStateful();
  }
}

class LoginStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginStateful> with SingleTickerProviderStateMixin {

  SCREEN_TYPE _screenType;
  bool _isTcChecked = false;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    _screenType = SCREEN_TYPE.SIGN_IN;
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.reset();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Color(0xff09495C),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          child: (_screenType == SCREEN_TYPE.SIGN_IN)
              ? _buildSignInUI()
              : (_screenType == SCREEN_TYPE.SIGN_UP)
              ? _buildSignUpUI()
              : _buildLoadingUI(),
        )
      ),
    );
  }

  _buildSignInUI() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          alignment: AlignmentDirectional.topEnd,
          child: Image(
            image: AssetImage("assets/mask_group_signin.png"),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: AlignmentDirectional.bottomStart,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Container(
                          alignment: AlignmentDirectional.bottomStart,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 2.5,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.bottomStart,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.03,
                        ),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "QuicksandBold",
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.bottomStart,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: Text(
                          "to Room Control",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "QuicksandMedium",
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                        topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.08,
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.person_outline,
                              size: MediaQuery.of(context).size.width * 0.06,
                              color: Colors.black87,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: "QuicksandMedium",
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                      )
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "QuicksandMedium",
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.06,
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.lock_outline,
                              size: MediaQuery.of(context).size.width * 0.06,
                              color: Colors.black87,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: "QuicksandMedium",
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                      )
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "QuicksandMedium",
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  obscureText: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.84,
                        height: MediaQuery.of(context).size.width * 0.1,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.15,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width * 0.01)),
                            color: Color(0xff02A89C),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2
                              ),
                            ]
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "QuicksandBold",
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.1,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black38,
                                fontFamily: "QuicksandMedium",
                                fontSize: MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                setState(() {
                                  _screenType = SCREEN_TYPE.SIGN_UP;
                                });
                              },
                              child: Text(
                                "  SIGN UP  ",
                                style: TextStyle(
                                  color: Color(0xff02B5AD),
                                  fontFamily: "QuicksandBold",
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildSignUpUI() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          alignment: AlignmentDirectional.topEnd,
          child: Image(
            image: AssetImage("assets/mask_group_signup.png"),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: AlignmentDirectional.bottomStart,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.12,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _screenType = SCREEN_TYPE.SIGN_IN;
                            });
                          },
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.02,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.width * 0.045,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.02,
                                    ),
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "QuicksandBold",
                                        fontSize: MediaQuery.of(context).size.width * 0.045,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.bottomStart,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Text(
                            "Create New Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "QuicksandMedium",
                              fontSize: MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                        topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.08,
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.person_outline,
                              size: MediaQuery.of(context).size.width * 0.06,
                              color: Colors.black87,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: "QuicksandMedium",
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                      )
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "QuicksandMedium",
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.06,
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.lock_outline,
                              size: MediaQuery.of(context).size.width * 0.06,
                              color: Colors.black87,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: "QuicksandMedium",
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                      )
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "QuicksandMedium",
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  obscureText: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.06,
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.mail_outline,
                              size: MediaQuery.of(context).size.width * 0.06,
                              color: Colors.black87,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: "QuicksandMedium",
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                      )
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "QuicksandMedium",
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  obscureText: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.1,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            Checkbox(
                              value: _isTcChecked,
                              activeColor: Color(0xff02B5AD),
                              onChanged: (value) {
                                setState(() {
                                  _isTcChecked = value;
                                });
                              },
                            ),

                            Text(
                              "I have accepted the  ",
                              style: TextStyle(
                                color: Colors.black38,
                                fontFamily: "QuicksandMedium",
                                fontSize: MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),

                            InkWell(
                              onTap: () {

                              },
                              child: Text(
                                "Terms & Condition",
                                style: TextStyle(
                                    color: Color(0xff02B5AD),
                                    fontFamily: "QuicksandBold",
                                    fontSize: MediaQuery.of(context).size.width * 0.035,
                                    decoration: TextDecoration.underline
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _screenType = SCREEN_TYPE.LOADING;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.84,
                          height: MediaQuery.of(context).size.width * 0.1,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.15,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width * 0.01)),
                              color: Color(0xff02A89C),
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2
                                ),
                              ]
                          ),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "QuicksandBold",
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildLoadingUI() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));});
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          alignment: AlignmentDirectional.topEnd,
          child: Image(
            image: AssetImage("assets/mask_group_signin.png"),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.center,
                width: MediaQuery.of(context).size.width * 0.3,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: animationController.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: Image(
                    image: AssetImage("assets/loading_progress.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.1,
                  bottom: MediaQuery.of(context).size.width * 0.2,
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Let's get you started",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "QuicksandMedium",
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }



}

enum SCREEN_TYPE {
  SIGN_IN,
  SIGN_UP,
  LOADING,
}
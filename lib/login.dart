import 'package:cartapplication/list.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageWidget> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  bool passwordVisibility = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late String email, password;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://uilogos.co/img/logotype/circle.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Please Signin To Continue',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF5F6061),
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: textController1,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'enter email';
                                    }
                                  },
                                  onChanged: (value) => email = value,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.length < 7 || value.isEmpty) {
                                      return 'enter 7 digit password';
                                    }
                                  },
                                  onChanged: (value1) => password = value1,
                                  controller: textController2,
                                  autofocus: false,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Password',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outlined,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility =
                                            !passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        if (email != null && password != null) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      dashboard()));

                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          setState(() {
                                            pref.setString('Email', email);
                                            pref.setString(
                                                'Password', password);
                                          });
                                        } else {
                                          const snackBar = SnackBar(
                                              content: Text(
                                                  'Password and Email is invalid'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    },
                                    child: Text('Login'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

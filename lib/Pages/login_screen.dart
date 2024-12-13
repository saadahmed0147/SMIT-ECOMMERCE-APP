import 'package:ecommerce_app/Components/round_button.dart';
import 'package:ecommerce_app/Components/round_textfield.dart';
import 'package:ecommerce_app/Data/colors.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:ecommerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  bool _loading = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  void onLogin() {
    setState(() {
      _loading = true;
    });
    _firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      setState(() {
        _loading = false;
      });
      Utils.flushBarErrorMessage('Login Successfully', context);
      Utils.flushBarErrorMessage(value.user!.email.toString(), context);
      Navigator.pushNamed(context, RouteName.home);
    }).onError((error, stackTrace) {
      setState(() {
        _loading = false;
      });
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mq.height * 0.4,
                decoration: const BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/loginPageImg.jpg"),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.07,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black,
                  height: mq.height * 0.036,
                )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Login",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
              ]),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundTextField(
                      label: 'Enter Email',
                      hint: 'Enter Email',
                      prefixIcon: Icons.mail,
                      inputType: TextInputType.emailAddress,
                      textEditingController: emailController,
                      validatorValue: 'Please Enter Email',
                      focusNode: emailFocusNode,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusNode(
                            context, emailFocusNode, passFocusNode);
                      },
                    ),
                    RoundTextField(
                      label: 'Enter Password',
                      hint: 'Enter Password',
                      inputType: TextInputType.name,
                      prefixIcon: Icons.key,
                      textEditingController: passwordController,
                      isPasswordField: true,
                      validatorValue: 'Please Enter Password',
                      focusNode: passFocusNode,
                      onFieldSubmitted: (value) {
                        onLogin();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.05,
              ),
              RoundButton(
                  loading: _loading,
                  title: 'Login',
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      onLogin();
                    }
                  }),
              SizedBox(
                height: mq.height * 0.02,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.signup);
                },
                child: const Text(
                  'Create New Account',
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

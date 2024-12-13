import 'package:ecommerce_app/Components/round_button.dart';
import 'package:ecommerce_app/Components/round_textfield.dart';
import 'package:ecommerce_app/Data/colors.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:ecommerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  void onSignUp() {
    setState(() {
      _loading = true;
    });
    _firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utils.flushBarErrorMessage('Sign Up Successfully', context);
      setState(() {
        _loading = false;
      });
      Navigator.pushNamed(context, RouteName.login);
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
      setState(() {
        _loading = false;
      });
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
                  child: Text("Sign Up",
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
                      inputType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
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
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: Icons.key,
                      textEditingController: passwordController,
                      isPasswordField: true,
                      validatorValue: 'Please Enter Password',
                      focusNode: passFocusNode,
                      onFieldSubmitted: (value) {
                        onSignUp();
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
                  title: 'Sign Up',
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      onSignUp();
                    }
                  }),
              SizedBox(
                height: mq.height * 0.02,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.login);
                },
                child: const Text(
                  'Already have an account?',
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

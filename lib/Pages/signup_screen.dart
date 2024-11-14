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
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: AppColors.greenColor,
          foregroundColor: AppColors.whiteColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: mq.height * 0.07,
                          fontWeight: FontWeight.w900,
                          color: AppColors.whiteColor),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RoundTextField(
                          label: 'Email',
                          hint: 'Email',
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
                          label: 'Password',
                          hint: 'Password',
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: RoundButton(
                        loading: _loading,
                        title: 'Sign Up',
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            onSignUp();
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteName.login);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color(0xff53b26e)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

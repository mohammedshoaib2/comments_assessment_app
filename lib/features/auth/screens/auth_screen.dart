// ignore_for_file: use_build_context_synchronously

import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:comments_assessment_app/features/auth/services/auth_services.dart';
import 'package:comments_assessment_app/features/auth/widgets/circular_loader.dart';
import 'package:comments_assessment_app/features/auth/widgets/custom_text_form_field.dart';
import 'package:comments_assessment_app/features/comments/screens/comments_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  bool isSignUp = true;

  bool isSubmitClicked = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void handleSignUp() async {
    User? user = await authServices.createUser(
        context: context,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    if (user != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const CommentsScreen();
      }));
    }

    setState(() {
      isSubmitClicked = false;
    });
  }

  void handleLogin() async {
    User? user = await authServices.loginUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
    if (user != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const CommentsScreen();
      }));
    }
    setState(() {
      isSubmitClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comments',
                style: GlobalVariables.kBoldTextStyle.copyWith(fontSize: 25.sp),
              ),
              const Spacer(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    isSignUp
                        ? CustomTextFormField(
                            text: 'Name', textEditingController: nameController)
                        : const SizedBox(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                        text: 'Email', textEditingController: emailController),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      text: 'Password',
                      textEditingController: passwordController,
                      isObscure: true,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isSubmitClicked = true;
                        });
                        isSignUp ? handleSignUp() : handleLogin();
                      }
                    },
                    color: GlobalVariables.kPrimaryColor,
                    minWidth: 170.w,
                    height: 40.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: isSubmitClicked
                        ? const CircularLoader()
                        : Text(
                            isSignUp ? 'Signup' : 'Login',
                            style: GlobalVariables.kBoldTextStyle
                                .copyWith(color: GlobalVariables.kWhite),
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSignUp ? 'Already have an account?' : 'New Here?',
                    style: GlobalVariables.kLightTextStyle,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignUp = !isSignUp;
                      });
                    },
                    child: Text(
                      isSignUp ? 'Login' : 'Signup',
                      style: GlobalVariables.kBoldTextStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

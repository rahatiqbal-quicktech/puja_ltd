import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/theme_color_textformfield.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/auth/register_screen.dart';
import 'package:puja_ltd/features/auth/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController contactController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   toolbarHeight: getHeight(context) * 20,
      //   title: const Text(
      //     "Puja Ltd",
      //     style: TextStyle(
      //       color: Colors.black87,
      //     ),
      //   ),
      //   backgroundColor: themeColor,
      //   elevation: 0.1,
      // ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ListView(
            children: [
              VerticalSpace(height: getHeight(context) * 2),
              Image(
                image: const AssetImage('assets/images/app_logo.png'),
                height: getHeight(context) * 20,
              ),
              // const ListTile(
              //   leading: Image(image: AssetImage('assets/images/app_logo.png')),
              //   title: Text("Puja Ltd Account Login"),
              //   subtitle:
              //       Text("Provide your account info to Log In with Puja Ltd"),
              // ),
              VerticalSpace(height: getHeight(context) * 5),
              const Text("Mobile Number"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: contactController,
                  textInputType: TextInputType.number,
                  icondata: Icons.phone,
                  hint: "012345"),
              VerticalSpace(height: getHeight(context) * 2),
              const Text("Password"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: passwordController,
                  hideText: true,
                  icondata: Icons.password,
                  hint: "Password"),
              VerticalSpace(height: getHeight(context) * 5),
              RoundButtonWidget(
                labelText: "Log In",
                backgroundColor: buttonColor,
                function: () {
                  if (_formKey.currentState!.validate()) {
                    LoginService().logIn(
                        contact: contactController.text,
                        password: passwordController.text);
                  }
                },
              ),
              const VerticalSpace(height: 10),

              RoundButtonWidget(
                labelText: "Register",
                backgroundColor: Colors.green,
                function: () {
                  Get.to(() => const RegisterScreen());
                },
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text("Forgot your password?"),
              // ),
            ],
          ),
        ),
      )),
    );
  }
}

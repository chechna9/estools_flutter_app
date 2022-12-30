import 'package:estools_mobile/components/inputField.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: myWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                EstlAssets.logoBlueRed,
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

final _formKey = GlobalKey<FormState>();
final TextEditingController emailCntrl = TextEditingController();
final TextEditingController passwordCntrl = TextEditingController();

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontSize: 40,
            color: myRed,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                labelText: 'Email',
                controller: emailCntrl,
                validator: (e) => e!.isEmpty ? 'required field' : null,
              ),
              const SizedBox(height: 15),
              CustomPasswordInput(
                labelText: 'Password',
                controller: passwordCntrl,
                validator: (e) => e!.isEmpty ? 'required field' : null,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, registerRoute);
                },
                child: const Text(
                  "don't  have an account ?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("coming soon"),
                  ));
                },
                child: const Text(
                  "forget your password ?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: const [
                  Flexible(child: SIGoogle_Button()),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(child: Login_Button()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Login_Button extends StatelessWidget {
  const Login_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ),
        backgroundColor: myDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 25,
              color: myWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.of(context).pushNamed(homeRoute);
        }
      },
    );
  }
}

class SIGoogle_Button extends StatelessWidget {
  const SIGoogle_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        backgroundColor: myGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            EstlAssets.googleLogo,
            width: 32,
          ),
          const SizedBox(
            width: 5,
          ),
          const Expanded(
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("coming soon"),
        ));
      },
    );
  }
}

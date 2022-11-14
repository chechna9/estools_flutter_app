import 'package:flutter/material.dart';
import 'package:estools_mobile/constants.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: myWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/logoBO.png",
                height: 127,
                width: 187,
              ),
              const RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 40,
            color: myRed,
            fontWeight: FontWeight.w900,
          ),
        ),
        Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: myGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'First Name',
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: myGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Last Name',
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: myGrey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email',
                    hintText: 'Please use appropriate email form'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: myGrey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Password',
                    hintText: 'Please use secure password'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: const [
                  Flexible(child: SIGoogle_Button()),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(child: SignUp_Button()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SignUp_Button extends StatelessWidget {
  const SignUp_Button({
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
            'Sign Up',
            style: TextStyle(
              fontSize: 25,
              color: myWhite,
            ),
          ),
        ],
      ),
      onPressed: () {},
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
            'assets/images/logo_googleg_48dp.png',
            width: 32,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Sign up with Google',
            style: TextStyle(
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}

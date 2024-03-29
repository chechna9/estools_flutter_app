import 'package:estools_mobile/components/inputField.dart';
import 'package:estools_mobile/service/auth.dart';
import 'package:estools_mobile/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:estools_mobile/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:estools_mobile/models/index.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              const Flexible(
                child: SingleChildScrollView(
                  child: RegisterForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _formKey = GlobalKey<FormState>();
final TextEditingController fnameCntrl = TextEditingController();
final TextEditingController lnameCntrl = TextEditingController();
final TextEditingController emailCntrl = TextEditingController();
final TextEditingController passwordCntrl = TextEditingController();

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
                labelText: 'First Name',
                controller: fnameCntrl,
                validator: (e) => e!.isEmpty ? 'required field' : null,
              ),
              const SizedBox(height: 15),
              CustomInputField(
                labelText: 'Last Name',
                controller: lnameCntrl,
                validator: (e) => e!.isEmpty ? 'required field' : null,
              ),
              const SizedBox(height: 15),
              CustomInputField(
                labelText: 'Email',
                controller: emailCntrl,
                validator: (e) => e!.isEmpty
                    ? 'required field'
                    : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(e)
                        ? 'this is not an email'
                        : null,
              ),
              const SizedBox(height: 15),
              CustomPasswordInput(
                labelText: 'Password',
                controller: passwordCntrl,
                validator: (e) => e!.length < 6 ? 'at least 6 character' : null,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, loginRoute);
                },
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Flexible(child: SIGoogle_Button()),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SignUp_Button(onPressed: () async {
                      Navigator.of(context).pushReplacementNamed(loginRoute,
                          arguments: {'email': emailCntrl.text});
                      if (_formKey.currentState!.validate()) {
                        late RequestSubmissionResponse response;

                        response = await Auth.signup(
                            emailCntrl.text,
                            passwordCntrl.text,
                            fnameCntrl.text,
                            lnameCntrl.text,
                            context);
                        if (response.isValid) {
                          Navigator.of(context).pushReplacementNamed(loginRoute,
                              arguments: {'email': emailCntrl.text});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response.message),
                              backgroundColor: myRed,
                            ),
                          );
                        }
                      }
                    }),
                  ),
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
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
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
              'Sign up with Google',
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

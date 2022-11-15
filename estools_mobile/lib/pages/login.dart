import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _header(context),
              _inputField(context),
              _signup(context),
              _forgotPassword(context),
              _btn(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(context) {
    return Column(
      children: [
        const SizedBox(
          height: 0,
        ),
        _logo(),
        const SizedBox(
          height: 50,
        ),
        _loginLabel(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _inputField(context) {
    var edgeInsets = EdgeInsets;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: deco,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Email",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19.93),
                  borderSide: BorderSide(color: myDark, width: 2)),
              fillColor: myGrey,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          decoration: deco,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Password",
              fillColor: myGrey,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              suffixIcon: Align(
                widthFactor: 2.5,
                heightFactor: 2.0,
                child: Icon(
                  Icons.visibility_outlined,
                  color: myDark,
                  size: 25,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19.93),
                  borderSide: BorderSide(color: myDark, width: 2)),
            ),
            obscureText: true,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Don't have an account ?",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget _forgotPassword(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot your password ?",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget _btn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            decoration: deco,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: myGrey,
                  shadowColor: myGrey,
                  fixedSize: const Size(138, 59),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(19.93))),
                ),
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/logo_googleg_48dp.png',
                  height: 18,
                ),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 8.74,
                    color: Colors.black,
                  ),
                ))),
        Container(
          decoration: deco,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login",
              style: TextStyle(fontSize: 27.06, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19.93))),
              fixedSize: const Size(138, 59),
              shadowColor: myGrey,
              primary: myDark,
            ),
          ),
        ),
      ],
    );
  }

  Widget _logo() {
    return Center(
      child: SizedBox(
        child: Image.asset('assets/images/logoBO.png'),
        height: 127.29,
        width: 187.3,
      ),
    );
  }

  Widget _loginLabel() {
    return Center(
      child: Text(
        "Login",
        style: TextStyle(
          color: myRed,
          fontWeight: FontWeight.bold,
          fontSize: 49.8,
        ),
      ),
    );
  }
}

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

  _header(context) {
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

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          shadowColor: myRed,
          elevation: 18,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19.93),
                borderSide: BorderSide(color: myDark, width: 2)),
            fillColor: myGrey,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          ),
        ),
        SizedBox(height: 25),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: myGrey,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            suffixIcon: ImageIcon(
              AssetImage('assets/images/openedEye.png'),
              size: 1,
              color: myDark,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19.93),
                borderSide: BorderSide(color: myDark, width: 2)),
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  _signup(context) {
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

  _forgotPassword(context) {
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

  _btn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: myGrey,
              shadowColor: myGrey,
              fixedSize: const Size(138, 59),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19.93))),
            ),
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/logo_googleg_48dp.png'),
              size: 18,
            ),
            label: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 8.74,
                color: Colors.black,
              ),
            )),
        ElevatedButton(
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
        )
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

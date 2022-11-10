import 'package:flutter/material.dart';
import 'package:estools_mobile/constants.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myWhite,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(35),
                child: Image.asset(
                  "assets/images/logoBO.png",
                  height: 127,
                  width: 187,
                )),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 49,
                  fontFamily: 'Poppins-Bold',
                  color: myRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 59,
                  width: 320,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: myGrey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'First Name',
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 59,
                  width: 320,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: myGrey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Last Name',
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 59,
                  width: 320,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: myGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Email',
                        hintText: 'Please use appropriate email form'),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 320,
                  height: 59,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: myGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password',
                        hintText: 'Please use secure password'),
                  ),
                )),
            TextButton(
              onPressed: () {},
              child: Text(
                "Already have an account?",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 59,
                  width: 160,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: myGrey,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {},
                      icon: ImageIcon(
                          AssetImage('assets/images/logo_googleg_48dp.png')),
                      label: Text(
                        'Sign up with Google',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black,
                        ),
                      )),
                ),
                SizedBox(
                  height: 59,
                  width: 160,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: myDark,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

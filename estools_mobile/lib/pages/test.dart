import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/logoWO.png"),
            Text("Azul World",
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

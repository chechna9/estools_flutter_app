import 'package:estools_mobile/components/home_item.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: myWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            EstlAssets.logoBlueRed,
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: [
                HomeItem(
                  name: 'Notes',
                  bgColor: Colors.white,
                  image: EstlAssets.notesIm,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(notesRoute);
                  },
                ),
                HomeItem(
                  name: 'Todo list',
                  bgColor: Colors.white,
                  image: EstlAssets.todoListIm,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(todolistRoute);
                  },
                ),
                HomeItem(
                  name: 'Timer',
                  bgColor: Colors.white,
                  image: EstlAssets.timerIm,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(timerRoute);
                  },
                ),
                HomeItem(
                  name: 'Gellerie',
                  bgColor: Colors.white,
                  image: EstlAssets.gallerieIm,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(homeRoute);
                  },
                ),
                HomeItem(
                  name: 'Agenda',
                  bgColor: Colors.white,
                  image: EstlAssets.agendaIm,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(agendaRoute);
                  },
                ),
                HomeItem(
                  name: 'Camera',
                  bgColor: Colors.white,
                  image: EstlAssets.cameraIm,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(homeRoute);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

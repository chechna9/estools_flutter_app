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
                    print("holla");
                  },
                ),
                HomeItem(
                  name: 'Todo list',
                  bgColor: Colors.white,
                  image: EstlAssets.todoListIm,
                  onPressed: () {
                    print("holla");
                  },
                ),
                HomeItem(
                  name: 'Timer',
                  bgColor: Colors.white,
                  image: EstlAssets.timerIm,
                  onPressed: () {
                    print("holla");
                  },
                ),
                HomeItem(
                  name: 'Gellerie',
                  bgColor: Colors.white,
                  image: EstlAssets.gallerieIm,
                  onPressed: () {
                    print("holla");
                  },
                ),
                HomeItem(
                  name: 'Agenda',
                  bgColor: Colors.white,
                  image: EstlAssets.agendaIm,
                  onPressed: () {
                    print("holla");
                  },
                ),
                HomeItem(
                  name: 'Camera',
                  bgColor: Colors.white,
                  image: EstlAssets.cameraIm,
                  onPressed: () {
                    print("holla");
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

import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/assets.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: myWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: SvgPicture.asset(EstlAssets.logoBlueRed),
          ),
          LinkTile(
            toggle: true,
            title: "home",
            icon: Icon(
              Icons.home,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, homeRoute);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinkTile(
            toggle: true,
            title: "Notes",
            icon: Icon(
              Icons.notes,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, notesRoute);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinkTile(
            toggle: true,
            title: "Todo list",
            icon: Icon(
              Icons.list,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, todolistRoute);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinkTile(
            toggle: true,
            title: "Timer",
            icon: Icon(
              Icons.timer,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, timerRoute);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinkTile(
            toggle: true,
            title: "Gellerie",
            icon: Icon(
              Icons.photo,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, gallerieRoute);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinkTile(
            toggle: true,
            title: "Agenda",
            icon: Icon(
              Icons.date_range_rounded,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, agendaRoute);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinkTile(
            toggle: true,
            title: "Camera",
            icon: Icon(
              Icons.camera_alt,
              color: myWhite,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, cameraRoute);
            },
          ),
        ],
      ),
    );
  }
}

class LinkTile extends StatefulWidget {
  final String title;
  final Icon icon;
  final Function onTap;
  bool toggle;
  LinkTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.toggle})
      : super(key: key);

  @override
  State<LinkTile> createState() => _LinkTileState();
}

class _LinkTileState extends State<LinkTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: widget.icon,
        iconColor: widget.toggle ? myWhite : myDark,
        title: Text(
          widget.title,
          style: TextStyle(color: widget.toggle ? myWhite : myDark),
        ),
        onTap: () {
          widget.onTap();
        },
        tileColor: widget.toggle ? myDark : myGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

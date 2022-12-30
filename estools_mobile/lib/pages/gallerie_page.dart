import 'package:estools_mobile/components/Drawer.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class GalleriePage extends StatefulWidget {
  // final AgendaModele agenda;
  // const AgendaPage({super.key, required this.agenda});
  const GalleriePage({super.key});

  @override
  State<GalleriePage> createState() => _GalleriePageState();
}

class _GalleriePageState extends State<GalleriePage> {
  bool allSelected = false;
  void selectAll() {
    setState(() {
      allSelected = !allSelected;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: myDark,
          centerTitle: true,
          title: Text(
            'Gallerie',
            style: EstlTStyle.appBarTitle,
          ),
        ),
        backgroundColor: myWhite,
        body: const Center(
          child: Text("Coming Soon"),
        ),
      ),
    );
  }
}

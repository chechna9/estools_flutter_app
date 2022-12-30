import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: myWhite,
          child: const NotesScreen(),
        ),
      ),
    );
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.max,
      children: [
        const MynotesBar(),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Flexible(
                child: Search(),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Note1(),
              const SizedBox(height: 20),
              const Note1(),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myRed,
                  padding: const EdgeInsets.all(10),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: myWhite,
                  size: 40,
                ),
              ),
              //const SizedBox(height: 10),
            ],
          ),
        ),
        const Categories(),
      ],
    );
  }
}

class MynotesBar extends StatelessWidget {
  const MynotesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: myDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.zero,
            topLeft: Radius.zero,
            bottomRight: Radius.zero,
            topRight: Radius.zero,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: myWhite,
            ),
            const SizedBox(width: 100),
            Text(
              'My notes',
              style: TextStyle(
                fontSize: 26,
                color: myWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [myBoxShadow]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19.93),
          ),
          fillColor: myGrey,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class Note1 extends StatelessWidget {
  const Note1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myGrey,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Colors.black38,
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 8.0,
            spreadRadius: -6.0,
          ),
        ],
      ),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: () {}),
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {},
              backgroundColor: myGrey,
              foregroundColor: Colors.red,
              icon: Icons.delete,
              //label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My dairies',
                    style: TextStyle(
                      fontSize: 17,
                      color: myDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Dear diary, ..........',
                    style: TextStyle(
                      fontSize: 12,
                      color: myDark,
                    ),
                  ),
                  Text(
                    '30 Dec',
                    style: TextStyle(
                      fontSize: 9,
                      color: myDark,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 13),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: myDark,
                      size: 20,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: myDark,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 40),
                height: 140,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0.0,
                          11.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: -5.0,
                      ),
                    ],
                    color: myRed,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "My life",
                        style: TextStyle(
                          fontSize: 20,
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "10 notes",
                        style: TextStyle(fontSize: 12, color: myWhite),
                      ),
                      const SizedBox(height: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.sticky_note_2,
                              color: myWhite,
                              size: 58,
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 40),
                height: 140,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0.0,
                          11.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: -5.0,
                      ),
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "My studies",
                        style: TextStyle(
                          fontSize: 20,
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "5 notes",
                        style: TextStyle(fontSize: 12, color: myWhite),
                      ),
                      const SizedBox(height: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.sticky_note_2,
                              color: myWhite,
                              size: 58,
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 40),
                height: 140,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0.0,
                          11.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: -5.0,
                      ),
                    ],
                    color: myRed,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "My life",
                        style: TextStyle(
                          fontSize: 20,
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "10 notes",
                        style: TextStyle(fontSize: 12, color: myWhite),
                      ),
                      const SizedBox(height: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.sticky_note_2,
                              color: myWhite,
                              size: 58,
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: myDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.zero,
            topLeft: Radius.circular(40),
            bottomRight: Radius.zero,
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 17,
                    color: myWhite,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                    color: myWhite,
                    onPressed: () {}),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CategoriesScroller(),
          ],
        ),
      ),
    );
  }
}

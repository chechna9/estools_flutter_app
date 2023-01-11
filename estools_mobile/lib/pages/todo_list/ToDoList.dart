import 'dart:ffi';

import 'package:estools_mobile/components/Drawer.dart';
import 'package:estools_mobile/components/filter_button.dart';
import 'package:estools_mobile/pages/todo_list/categ_tdl_card.dart';
import 'package:estools_mobile/pages/todo_list/task_card.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/screen_dim.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TdlPage extends StatelessWidget {
  const TdlPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
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
          'Todo List',
          style: EstlTStyle.appBarTitle,
        ),
      ),
      body: Container(
        color: myWhite,
        child: const TasksScreen(),
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
  const TasksScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // filter buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterButton(
                    title: 'In progress',
                    onPressed: () {},
                  ),
                  FilterButton(
                    title: 'Completed',
                    onPressed: () {},
                    activated: false,
                  ),
                  FilterButton(
                    title: 'Archived',
                    onPressed: () {},
                    activated: false,
                  ),
                ],
              ),
              TaskCard(
                title: 'Home Work',
                startDate: '18 Nov',
                endDate: '23 Nov',
                progress: 60,
                onComplete: () {},
                onArchive: () {},
                onDelete: () {},
              ),
              TaskCard(
                title: 'Home Work',
                startDate: '18 Nov',
                endDate: '23 Nov',
                progress: 60,
                onComplete: () {},
                onArchive: () {},
                onDelete: () {},
              ),

              const SizedBox(height: 70),
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
                Icon(
                  Icons.more_vert,
                  color: myWhite,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TdlCategCard(
                    categName: 'Home Work',
                    numberOfTasks: 15,
                    icon: Icons.home,
                    bgColor: Colors.red,
                    progress: 15)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

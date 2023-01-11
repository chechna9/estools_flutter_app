import 'package:estools_mobile/components/Drawer.dart';
import 'package:estools_mobile/components/filter_button.dart';
import 'package:estools_mobile/pages/todo_list/categ_tdl_card.dart';
import 'package:estools_mobile/pages/todo_list/task_card.dart';
import 'package:estools_mobile/constants.dart';

import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class TdlPage extends StatefulWidget {
  const TdlPage({Key? key}) : super(key: key);

  @override
  State<TdlPage> createState() => _TdlPageState();
}

class _TdlPageState extends State<TdlPage> {
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: myRed,
        child: Icon(
          Icons.add_rounded,
          size: 40,
        ),
        onPressed: () {},
      ),
      backgroundColor: myWhite,
      body: const TasksScreen(),
    );
  }
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    bool isModal = true;

    void _showCateg(BuildContext ctx) {
      setState(() {
        isModal = true;
      });
      showModalBottomSheet(
        barrierColor: Colors.transparent,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        elevation: 0,
        context: ctx,
        builder: (ctx) => FractionallySizedBox(
          heightFactor: 0.35,
          child: Container(
            color: myWhite,
            child: const Categories(),
          ),
        ),
      );
    }

    return Padding(
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
          Flexible(
            child: ListView(
              children: [
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
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () {
                _showCateg(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: myDark,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: Text(
                'Home Work',
                style: EstlTStyle.categorieTitle,
              ),
            ),
          ),
        ],
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

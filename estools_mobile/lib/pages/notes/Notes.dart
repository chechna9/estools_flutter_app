import 'package:estools_mobile/components/Drawer.dart';

import 'package:estools_mobile/components/inputField.dart';
import 'package:estools_mobile/models/note_model.dart';
import 'package:estools_mobile/pages/notes/add_note_form.dart';
import 'package:estools_mobile/pages/notes/categ_notes_card.dart';
import 'package:estools_mobile/pages/notes/note_card.dart';
import 'package:estools_mobile/constants.dart';

import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController searchCntrl = TextEditingController();
  List<Note> listNotes = [
    Note(
      title: 'Home Work',
      description:
          'Holla today am gonna do my home Works Holla today am gonna do my home WorksHolla today am gonna do my home Works',
      add_date: '',
      category: '',
    ),
    Note(
      title: 'Workout',
      description:
          'Holla today am gonna do my home Workout Holla today am gonna do my home WorksHolla today am gonna do my home Works',
      add_date: '',
      category: '',
    ),
  ];
  void addNote(Note e) {
    setState(() {
      listNotes.add(e);
    });
  }

  void deleteNote(int index) {
    setState(() {
      listNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    void showCateg(BuildContext ctx) {
      showModalBottomSheet(
        barrierColor: Colors.transparent,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        elevation: 0,
        context: ctx,
        builder: (ctx) => FractionallySizedBox(
          // heightFactor: 0.34,
          child: Container(
            color: myWhite,
            child: const Categories(),
          ),
        ),
      );
    }

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
          'Notes',
          style: EstlTStyle.appBarTitle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myRed,
        child: const Icon(
          Icons.add_rounded,
          size: 40,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddNoteForm(
              addNote: addNote,
            ),
          );
        },
      ),
      backgroundColor: myWhite,
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Search Input
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchInput(
                    controller: searchCntrl,
                    onClick: () {},
                    labelText: 'Search',
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: listNotes.length,
                itemBuilder: (context, index) => listNotes
                    .map(
                      (e) => NoteCard(
                        title: e.title,
                        onDelete: () => deleteNote(index),
                        body: e.description,
                        startDate: e.add_date,
                      ),
                    )
                    .toList()[index],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                onPressed: () {
                  showCateg(context);
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
    return SingleChildScrollView(
      child: Container(
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
                children: const [
                  NotesCatedCard(
                    categName: 'Home Work',
                    numberOfTasks: 15,
                    icon: Icons.home,
                    bgColor: Colors.red,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

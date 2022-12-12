import 'package:estools_mobile/pages/agenda/action_card.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/models/action_model.dart';
import 'package:estools_mobile/models/agenda_model.dart';
import 'package:estools_mobile/models/agenda_model.dart';
import 'package:estools_mobile/models/day_model.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  // final AgendaModele agenda;
  // const AgendaPage({super.key, required this.agenda});
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  AgendaModele agenda = AgendaModele(days: [
    DayModele(actions: [
      ActionModele(
        time: '08:30',
        date: '1 nov',
        name: 'Devfest day 1 action 1',
        main: Colors.blue[200],
        sec: Colors.blue,
      ),
      ActionModele(
        time: '10:30',
        date: '1 nov',
        name: 'Devfest day 1 action 2',
        main: Colors.amber[200],
        sec: Colors.amber,
      ),
      ActionModele(
        time: '11:30',
        date: '1 nov',
        name: 'Devfest day 1 action 3',
        main: Colors.blue[200],
        sec: Colors.blue,
      ),
      ActionModele(
        time: '12:30',
        date: '1 nov',
        name: 'Devfest day 1 action 4',
        main: Colors.red[200],
        sec: Colors.red,
      ),
      ActionModele(
        time: '14:30',
        date: '1 nov',
        name: 'Devfest day 1 action 5',
        main: Colors.blue[200],
        sec: Colors.blue,
      ),
    ]),
    DayModele(actions: [
      ActionModele(
        time: '08:30',
        date: '1 nov',
        name: 'Devfest day 2 action 1',
        main: Colors.blue[200],
        sec: Colors.blue,
      ),
      ActionModele(
        time: '10:30',
        date: '2 nov',
        name: 'Devfest day 2 action 2',
        main: Colors.amber[200],
        sec: Colors.amber,
      ),
      ActionModele(
        time: '11:30',
        date: '2 nov',
        name: 'Devfest day 2 action 3',
        main: Colors.red[200],
        sec: Colors.red,
      ),
      ActionModele(
        time: '12:30',
        date: '2 nov',
        name: 'Devfest day 2 action 4',
        main: Colors.blue[200],
        sec: Colors.blue,
      ),
    ]),
    DayModele(actions: [
      ActionModele(
        time: '08:30',
        date: '1 nov',
        name: 'Devfest day 3 action 1',
        main: Colors.blue[200],
        sec: Colors.blue,
      ),
      ActionModele(
        time: '10:30',
        date: '2 nov',
        name: 'Devfest day 3 action 2',
        main: Colors.amber[200],
        sec: Colors.amber,
      ),
    ])
  ]);
  late int currentDay;
  void setCurrentDay(day) {
    setState(() {
      currentDay = day;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentDay = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: myDark,
          centerTitle: true,
          title: Text(
            'Agenda',
            style: EstlTStyle.appBarTitle,
          ),
        ),
        backgroundColor: myWhite,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              // generate days from agenda
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: agenda.days.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: buttonBoxShadow,
                          ),
                          child: TextButton(
                            onPressed: () {
                              setCurrentDay(index + 1);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              backgroundColor:
                                  (index + 1) == currentDay ? myRed : myWhite,
                              shape: RoundedRectangleBorder(
                                side: (index + 1) == currentDay
                                    ? BorderSide.none
                                    : const BorderSide(),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              'DAY ${index + 1}',
                              style: TextStyle(
                                color: (index + 1) == currentDay
                                    ? myWhite
                                    : myDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Flexible(
                flex: 3,
                child: ListView(
                  children: agenda.days[currentDay - 1].actions
                      .map(
                        (e) => ActionCard(action: e),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

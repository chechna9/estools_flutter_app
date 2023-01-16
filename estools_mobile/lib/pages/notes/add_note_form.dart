import 'package:estools_mobile/components/inputField.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController titleCntrl = TextEditingController();
  final TextEditingController descriptionCntrl = TextEditingController();
  String? colorVal;
  String? categVal;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              // title
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [myBoxShadow],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: CustomBurders.myOutlinedBorder(color: myDark),
                    focusedBorder:
                        CustomBurders.myOutlinedBorder(color: myDark),
                    fillColor: myGrey,
                    filled: true,
                    hintText: 'Title',
                  ),
                ),
              ),
              // categorie and icon and color
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    elevation: 12,
                    hint: Text('Categorie'),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: myDark,
                    ),
                    style: TextStyle(
                      color: myDark,
                      fontSize: 20,
                    ),
                    underline: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: myDark,
                        )),
                      ),
                    ),
                    value: categVal,
                    onChanged: (v) {
                      setState(() {
                        categVal = v;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'All',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('All'),
                            const SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.all_inclusive_sharp,
                              color: myDark,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Home',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Home Work'),
                            const SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.home_rounded,
                              color: myDark,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Sport',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Sport'),
                            const SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.sports_baseball_rounded,
                              color: myDark,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  DropdownButton(
                    elevation: 12,
                    hint: Text('Color'),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: myDark,
                    ),
                    style: TextStyle(
                      color: myDark,
                      fontSize: 20,
                    ),
                    underline: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: myDark,
                          ),
                        ),
                      ),
                    ),
                    value: colorVal,
                    onChanged: (v) {
                      setState(() {
                        colorVal = v;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'Red',
                        child: Row(
                          children: [
                            const Text('Red'),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.circle,
                              color: myRed,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Blue',
                        child: Row(
                          children: [
                            const Text('Blue'),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.circle,
                              color: myDark,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Green',
                        child: Row(
                          children: [
                            const Text('Green'),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.circle,
                              color: EstlColors.greenDone,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Text Area
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [myBoxShadow],
                ),
                child: TextFormField(
                  minLines: 5,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: CustomBurders.myOutlinedBorder(color: myDark),
                    focusedBorder:
                        CustomBurders.myOutlinedBorder(color: myDark),
                    fillColor: myGrey,
                    filled: true,
                    hintText: 'my note',
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

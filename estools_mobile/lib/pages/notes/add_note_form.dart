import 'package:estools_mobile/components/inputField.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/models/configuration.dart';
import 'package:estools_mobile/models/note_model.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNoteForm extends StatefulWidget {
  final Function addNote;
  const AddNoteForm({super.key, required this.addNote});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController titleCntrl = TextEditingController();
  final TextEditingController descriptionCntrl = TextEditingController();
  String? colorVal;
  String? categVal;
  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey.withOpacity(0.9),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // title
                CustomInputField(
                    labelText: 'Title',
                    validator: (e) => e!.isEmpty ? 'required field' : null,
                    controller: titleCntrl),
                const SizedBox(
                  height: 20,
                ),
                // categorie and icon and color
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton(
                      elevation: 12,
                      hint: const Text('Categorie'),
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
                const SizedBox(
                  height: 20,
                ),
                // Text Area
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [myBoxShadow],
                  ),
                  child: TextFormField(
                    controller: descriptionCntrl,
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
                const SizedBox(
                  height: 20,
                ),
                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          backgroundColor: myWhite,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          'Discard',
                          style: TextStyle(
                            fontSize: 20,
                            color: myDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            categVal = categVal ?? 'All';
                            final String now =
                                new DateTime.now().toString().split(' ')[0];
                            final List<String> splitedNow = now.split('-');
                            final String date =
                                '${splitedNow[2]}/${splitedNow[1]}/${splitedNow[0]}';

                            final Note newNote = Note(
                              title: titleCntrl.text,
                              description: descriptionCntrl.text,
                              add_date: date,
                              category: categVal!,
                            );
                            widget.addNote(newNote);
                            Navigator.pop(context);
                            // ConfigurationModel _config =
                            //     Provider.of<ConfigurationModel>(context,
                            //         listen: false);
                            // _config.setNote(newNote);

                            // try {
                            //   ConfigurationModel _config =
                            //       Provider.of<ConfigurationModel>(context,
                            //           listen: false);
                            //   _config.setNote(newNote);
                            // } catch (e) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(content: Text(e.toString())));
                            // }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          backgroundColor: myDark,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20,
                            color: myWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

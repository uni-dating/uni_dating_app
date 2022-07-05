import 'dart:async';
import 'dart:io';
import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';
import 'package:uni_dating_app/models/profile/profile.model.dart';

import '../main/main.screen.dart';

enum WidgetType { BASIC, REMOVABLE }

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  static const String routeName = '/edit_profile';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: GetProfileDate());
  }
}

class GetProfileDate extends StatefulWidget {
  GetProfileDate({Key? key}) : super(key: key);

  @override
  GetProfileDateState createState() => GetProfileDateState();
}

class GetProfileDateState extends State<GetProfileDate> {
  static DateTime birthDate = DateTime.now();

  // *
  //
  // VARIABLE WITH ALL THE INFO ABOUT USER
  //
  // * //
  static ProfileModel profile = ProfileModel(links: []);

  // *
  //
  // READ COMMENT ABOVE
  //
  // * //

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _linkTitleController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  String linkTitle = 'Title';
  String link = 'Link';
  List<Link> links = [];

  Faculty faculty = Faculty.None;
  Degree degree = Degree.None;
  String photoLocation = "";
  File? img;

  FileImage? fileImage;

  AssetImage assetImage = AssetImage('lib/assets/imgs/UploadPhoto.png');

  DecorationImage getDecorationImage([FileImage? fileImage]) {
    if (fileImage == null) {
      return DecorationImage(image: assetImage, fit: BoxFit.fill);
    }
    return DecorationImage(image: fileImage, fit: BoxFit.fill);
  }

  Widget getRemovableWidget(Link _link, int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          Container(
              width: 99,
              height: 40,
              margin: const EdgeInsets.fromLTRB(0, 6, 14, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  _link.linkTitle,
                  style: const TextStyle(color: Colors.black),
                ),
              )),
          Container(
              height: 40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: () {},
                child: Text(
                  _link.link,
                  style: const TextStyle(color: Colors.black),
                ),
              )),
          const Spacer(),
          Container(
              margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
              height: 40,
              width: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: () {
                  setState(() {
                    links.removeAt(index);
                  });
                },
                child: const Text(
                  '-',
                  style: TextStyle(color: Colors.black),
                ),
              ))

          /////
        ],
      ),
    );
  }

  Widget getLinkWidget() {
    return Row(
      children: [
        Container(
            width: 99,
            height: 40,
            margin: EdgeInsets.fromLTRB(0, 6, 14, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: const Text('Enter Link Title'),
                        content: TextField(
                          controller: _linkTitleController,
                        ),
                        actions: [
                          TextButton(
                              child: const Text('Add'),
                              onPressed: () {
                                setState(() {
                                  linkTitle = _linkTitleController.text;
                                });

                                Navigator.pop(context);
                              })
                        ],
                      ),
                );
              },
              child: Text(
                linkTitle,
                style: const TextStyle(color: Colors.black),
              ),
            )),
        Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            height: 40,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: const Text('Enter Link'),
                        content: TextField(
                          controller: _linkController,
                        ),
                        actions: [
                          TextButton(
                              child: const Text('Add'),
                              onPressed: () {
                                setState(() {
                                  link = _linkController.text;
                                });

                                Navigator.pop(context);
                              })
                        ],
                      ),
                );
              },
              child: Text(
                link,
                style: const TextStyle(color: Colors.black),
              ),
            )),
        const Spacer(),
        Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            height: 40,
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
              onPressed: () {
                if (link == 'Link') {
                  return;
                }
                if (linkTitle == 'Title') {
                  return;
                }
                // links.addAll({linkTitle: link});

                setState(
                      () {
                    this.links.add(new Link(linkTitle, link));
                    link = 'Link';
                    linkTitle = 'Title';
                  },
                );
              },
              child: const Text(
                '+',
                style: TextStyle(color: Colors.black),
              ),
            ))

        /////
      ],
    );
  }

  // void dropDownCallback(Faculty? selectedValue){
  //   if(selectedValue is Faculty){
  //     setState((){
  //       faculty = selectedValue;
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              )),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            child: Row(
              children: [
                Container(
                    width: 136,
                    height: 136,
                    margin: EdgeInsets.fromLTRB(0, 37, 35, 0),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero),
                      onPressed: () async {
                        final img = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);

                        photoLocation = img != null ? img.path : "";
                        print(photoLocation);
                        fileImage = FileImage(File(photoLocation));
                        setState(() {});
                      },

                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: getDecorationImage(fileImage),
                        ),
                      ),

                      // padding: const EdgeInsets.all(50.0),
                    )),
                Column(
                  children: [
                    const Text("Date of Birth",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                    ElevatedButton(
                      onPressed: () async {
                        var newDate = await showDatePicker(
                            context: context,
                            initialDate: birthDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());

                        if (newDate == null) return;

                        setState(() => birthDate = newDate);
                      },
                      child: Text(
                        '${birthDate.year}/${birthDate.month}/${birthDate.day}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[300],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              height: 44,
              margin: const EdgeInsets.fromLTRB(0, 39, 0, 0),
              child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'First Name',
                  ))),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              height: 44,
              margin: const EdgeInsets.fromLTRB(0, 14, 0, 0),
              child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Last Name',
                  ))),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              margin: const EdgeInsets.fromLTRB(0, 14, 0, 0),
              child: SizedBox(
                  height: 107,
                  child: TextField(
                      controller: _bioController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 100,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        alignLabelWithHint: true,
                        labelText: 'Bio',
                      )))),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: Row(children: const [
                Text(
                  'Links',
                  textAlign: TextAlign.left,
                )
              ])),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            child: Column(
              // children: linkWidgets,
              children: [
                getLinkWidget(),
                // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: links.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getRemovableWidget(links[index], index);
                    })
              ],
            ),
          ),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                  child: Column(
                    children: [
                      Row(children: const [
                        Text(
                          'University Info',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        )
                      ]),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 37, 0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 88,
                                    child: const Text(
                                      'Faculty',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    margin:
                                    const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[300],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      onPressed: () => {},
                                      child: DropdownButton<Faculty>(
                                        value: faculty,
                                        elevation: 16,
                                        underline: Container(
                                          height: 2,
                                        ),
                                        onChanged: (Faculty? newValue) {
                                          setState(() {
                                            faculty = newValue!;
                                          });
                                        },
                                        items: <Faculty>[
                                          Faculty.AC,
                                          Faculty.ESB,
                                          Faculty.INF,
                                          Faculty.TD,
                                          Faculty.TEC,
                                          Faculty.None
                                        ].map<DropdownMenuItem<Faculty>>(
                                                (Faculty value) {
                                              return DropdownMenuItem<Faculty>(
                                                value: value,
                                                child: Text(value.name),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                      width: 88,
                                      child: const Text('Degree',
                                          style: TextStyle(fontSize: 18))),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    margin:
                                    const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12.0)),
                                      ),
                                      onPressed: () => {},
                                      child: DropdownButton<Degree>(
                                        value: degree,
                                        elevation: 16,
                                        underline: Container(
                                          height: 2,
                                        ),
                                        onChanged: (Degree? newValue) {
                                          setState(() {
                                            degree = newValue!;
                                          });
                                        },
                                        items: <Degree>[
                                          Degree.None,
                                          Degree.Bachelor,
                                          Degree.Master
                                        ].map<DropdownMenuItem<Degree>>(
                                                (Degree value) {
                                              return DropdownMenuItem<Degree>(
                                                value: value,
                                                child: Text(value.name),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              width: 243,
              height: 51,
              child: ElevatedButton(

                  onPressed: () {
                    var _fName = _firstNameController.text;
                    var _lName = _lastNameController.text;
                    var _bio = _bioController.text;

                    profile.setFirstName(_fName);
                    profile.setLastName(_lName);
                    profile.setBio(_bio);
                    profile.setImageLocation(photoLocation);
                    profile.setLinks(this.links);
                    profile.setFaculty(this.faculty);
                    profile.setDegree(this.degree);

// Push to Backend

                    MainInitScreen.navigate(context);
// Finish Registration
                  },
                  child: const Text(
                    'Complete',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ))),
        ],
      ),
    );
  }
}

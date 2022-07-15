import 'dart:async';
import 'dart:io';
import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/auth/auth.bloc.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/ui/screens/profile/edit_profile.bloc.dart';
import 'package:uni_dating_app/utils/nested_navigator.dart';
import 'package:uni_dating_app/utils/simple_code.dart';
import 'package:uuid/uuid.dart';

import '../main/main.screen.dart';

enum WidgetType { BASIC, REMOVABLE }

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GetProfileDate(),
    );
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
  UserInfoModel profile = UserInfoModel(
    links: [],
    id: const Uuid().v1(),
  );

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

  AssetImage assetImage = const AssetImage('lib/assets/imgs/UploadPhoto.png');

  DecorationImage getDecorationImage([FileImage? fileImage]) {
    if (fileImage == null) {
      return DecorationImage(image: assetImage, fit: BoxFit.fill);
    }
    return DecorationImage(image: fileImage, fit: BoxFit.fill);
  }

  Widget getRemovableWidget(Link link, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  link.linkTitle,
                  style: const TextStyle(color: Colors.black),
                ),
              )),
          Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: () {},
                child: Text(
                  link.link,
                  style: const TextStyle(color: Colors.black),
                ),
              )),
          const Spacer(),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
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
            margin: const EdgeInsets.fromLTRB(0, 6, 14, 0),
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
                  builder: (context) => AlertDialog(
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
            margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
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
            margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
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
                    links.add(new Link(linkTitle, link));
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

  @override
  void initState() {
    runAfterBuild((duration) {
      if (EditProfileBloc.of(context).user.value == null) return;
      print('im here');
      profile = EditProfileBloc.of(context).user.value!;
      _firstNameController.text = profile.firstName ?? '';
      _lastNameController.text = profile.lastName ?? '';
      _bioController.text = profile.bio ?? '';

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Container(
                      width: 136,
                      height: 136,
                      margin: const EdgeInsets.fromLTRB(0, 37, 35, 0),
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                            //backgroundColor: Colors.white,
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
                          final newDate = await showDatePicker(
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
                width: MediaQuery.of(context).size.width * 0.8,
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
                width: MediaQuery.of(context).size.width * 0.8,
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
              width: MediaQuery.of(context).size.width * 0.8,
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
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: const [
                  Text(
                    'Links',
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
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
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'University Info',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 37, 0),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      width: 88,
                                      child: Text(
                                        'Faculty',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 40,
                                      margin: const EdgeInsets.fromLTRB(
                                        0,
                                        14,
                                        0,
                                        0,
                                      ),
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
                              Column(
                                children: [
                                  const SizedBox(
                                      width: 88,
                                      child: Text('Degree',
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
                onPressed: () async {
                  final fName = _firstNameController.text;
                  final lName = _lastNameController.text;
                  final bio = _bioController.text;

                  profile
                    ..setFirstName(fName)
                    ..setLastName(lName)
                    ..setBio(bio)
                    ..setImageLocation(photoLocation)
                    ..setLinks(links)
                    ..setFaculty(faculty)
                    ..setDegree(degree);

// Push to Backend
                  bool result;
                  if (EditProfileBloc.of(context).user.value == null) {
                    profile
                      ..setEmail(AuthBloc.of(context).email)
                      ..setPassword(AuthBloc.of(context).password);

                    result = await AuthBloc.of(context).addUser(profile);
                  } else {
                    result =
                        await EditProfileBloc.of(context).updateUser(profile);
                  }

                  if (result) {
                    if (!mounted) return;

                    final parentContext = NestedNavigator.maybeOf(context)
                        ?.parentNavigatorRoute
                        ?.navigator
                        ?.context ?? context;
                    await Navigator.pushNamedAndRemoveUntil(
                        parentContext, MainInitScreen.routeName, (_) => false);
                  }
// Finish Registration
                },
                child: const Text(
                  'Complete',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.grey[300],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

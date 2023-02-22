import 'dart:io';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import '../Helper/App_notifier.dart';
import '../Widgets/custom_app_bar.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.title});

  @override
  _RegisterFormState createState() => _RegisterFormState();
  final String title;

}

class _RegisterFormState extends State<RegisterForm> {
  List<String> attachments = [];
  bool isHTML = false;
  String username = 'Kbmtours110@gmail.com';
  String password = 'yaalimadad!12MUSAKBM';
  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController passportnumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController travelingfrom = TextEditingController();
  TextEditingController howmanyperson = TextEditingController();
  TextEditingController anymedical = TextEditingController();
  TextEditingController emergencycontactname = TextEditingController();
  TextEditingController emergencycontactnumber = TextEditingController();

  TextEditingController howdidyouhear = TextEditingController();
  TextEditingController areyouvaccinated = TextEditingController();
  TextEditingController uploadpassport = TextEditingController();
  TextEditingController uploadgreencard = TextEditingController();
  TextEditingController uploadid = TextEditingController();

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    dob.dispose();
    passportnumber.dispose();
    address.dispose();
    phonenumber.dispose();
    travelingfrom.dispose();
    howmanyperson.dispose();
    anymedical.dispose();
    emergencycontactname.dispose();
    emergencycontactnumber.dispose();
    howdidyouhear.dispose();
    areyouvaccinated.dispose();
    uploadpassport.dispose();
    uploadgreencard.dispose();
    uploadid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/pexels-beytlik-7522164.jpg"),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(48)
            ),
            color:Colors.white.withOpacity(0.1),
          ),
          child: GestureDetector(
            child: Container(padding: EdgeInsets.all(16),margin: EdgeInsets.all(20),height: 65,
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                ),
                color:Color(0xffa80000),
              ),
              child: Center(
                child: Text(
                  'Submit',textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                        MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              ),
            ),

            onTap: () async {
              setState(() {
                isLoading = true;
              });
              if (_formKey.currentState!.validate()) {
                var smtpServer = gmail(username, password);

                List<Attachment> atc = [];

                attachments.forEach((element) {
                  atc.add(FileAttachment(File(element))
                    ..location = Location.attachment);
                });

                final message = Message()
                  ..from = Address(username, 'K.B.M Tours')
                  ..recipients.add('$username')
                  ..subject =
                      'Enquiry application from K.B.M Tours Mobile App  '
                  ..text = '''\n
First names : ${firstname.text.toString()} 
Last names : ${lastname.text.toString()} 
DOB : ${dob.text.toString()}
Passport Number : ${passportnumber.text.toString()}
Address : ${address.text.toString()}
Phone number : ${phonenumber.text.toString()}
Traveling from (which airport) : ${travelingfrom.text.toString()}
How many persons traveling with you  (only names) : ${howmanyperson.text.toString()}
Any medical condition : ${anymedical.text.toString()}
Emergency contact name : ${emergencycontactname.text.toString()}
Emergency contact number : ${emergencycontactnumber.text.toString()}
How did you hear about us : ${howdidyouhear.text.toString()}
Are you vaccinated : ${areyouvaccinated.text.toString()}
                          \n'''
                  ..attachments = atc;

                try {
                  final sendReport =
                  await send(message, smtpServer);
                  setState(() {
                    isLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Registered Successfully')));
                  print('Message sent: ' + sendReport.toString());
                  Clear();
                } on MailerException catch (e) {
                  debugPrint(username + password);
                  print(e.toString());
                  print('Message not sent.');
                  for (var p in e.problems) {
                    print('Problem: ${p.code}: ${p.msg}');
                  }
                }
              } else {
                setState(() {
                  isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                    Text('Please check the missing fields')));
              }
              setState(() {
                isLoading = false;
              });
            },
          ),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child:  Consumer<AppStateNotifier>(
                builder: (context, appState, child) {
                  return CustomAppBar(Name:widget.title, isCompass: false,isDark: appState.isDarkMode,);
                }
            )),
        body: isLoading == false
            ? Container(
          height: double.maxFinite,

          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Builder(
                      builder: (context) => Form(
                        key: _formKey,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)
                                    )

                                  ),
                                  child: TextFormField(
                                    controller: firstname,
                                    decoration: InputDecoration(
                                      hintText: 'First name',
                                      focusColor: Colors.white,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: false,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your first name.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: lastname,
                                    decoration: InputDecoration(
                                      hintText: 'Last name',
                                      focusColor: Colors.white,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Last name.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    onTap: () async {
                                      DateTime? date = DateTime(1900);
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());

                                      date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100));

                                      dob.text = (date != null
                                          ? date
                                          .toIso8601String()
                                          .toString()
                                          .substring(0, 10)
                                          : null)!;
                                    },
                                    controller: dob,
                                    decoration: InputDecoration(
                                      hintText: 'Date of Birth',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Date of Birth.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: passportnumber,
                                    decoration: InputDecoration(
                                      hintText: 'Passport Number',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Passport Number.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: address,
                                    decoration: InputDecoration(
                                      hintText: 'Address',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your full Address.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: phonenumber,
                                    inputFormatters: [
                                      // WhitelistingTextInputFormatter
                                      //     .digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Phone number',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value!.length < 5) {
                                        return 'Please enter your correct Phone Number.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: travelingfrom,
                                    decoration: InputDecoration(
                                      hintText:
                                      'Traveling from (which airport)',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please mention your nearby airport name.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: howmanyperson,
                                    decoration: InputDecoration(
                                      hintText:
                                      'How many persons traveling with you  (only names)',
                                      focusColor: Colors.white,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please mention names of the people\n who are travelling with you.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: anymedical,
                                    decoration: InputDecoration(
                                      hintText: 'Any medical condition',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your medical condition.\nif any?';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: emergencycontactname,
                                    decoration: InputDecoration(
                                      hintText: 'Emergency contact name',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your emergency contact name';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    inputFormatters: [
                                      // WhitelistingTextInputFormatter
                                      //     .digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: emergencycontactnumber,
                                    decoration: InputDecoration(
                                      hintText:
                                      'Emergency contact number',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value!.length < 5) {
                                        return 'Please enter your emergency contact number';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: howdidyouhear,
                                    decoration: InputDecoration(
                                      hintText:
                                      'How did you hear about us',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    controller: areyouvaccinated,
                                    decoration: InputDecoration(
                                      hintText: 'Are you vaccinated',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please mention \'yes\' for vaccinated \nand \'no\' for not vaccinated.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    //readOnly: true,
                                    onTap: () async {
                                      await _openImagePicker()
                                          .then((value) {
                                        setState(() {
                                          uploadpassport.text = value;
                                        });
                                      });
                                    },
                                    controller: uploadpassport,
                                    decoration: InputDecoration(
                                      hintText: 'Upload passport photo',
                                      focusColor: Colors.white,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please upload your passport photo.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    //readOnly: true,
                                    onTap: () async {
                                      await _openImagePicker()
                                          .then((value) {
                                        setState(() {
                                          uploadgreencard.text = value;
                                        });
                                      });
                                    },
                                    controller: uploadgreencard,
                                    decoration: InputDecoration(
                                      hintText:
                                      'Upload green card photo (if no us passport holder)',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                      )

                                  ),                                child: TextFormField(
                                    //readOnly: true,
                                    onTap: () async {
                                      await _openImagePicker()
                                          .then((value) {
                                        setState(() {
                                          uploadid.text = value;
                                        });
                                      });
                                    },
                                    controller: uploadid,
                                    decoration: InputDecoration(
                                      hintText: 'Upload your ID',
                                      focusColor: Colors.transparent,
                                      enabledBorder:
                                      const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      new OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      border: const OutlineInputBorder(),
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your ID.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ).frosted(
                          blur: 22.5,borderRadius: BorderRadius.circular(24),padding: EdgeInsets.all(5),
                        ),
                      )),

                ],
              ),
            ),
          ),
        )
            : Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
    );
  }

  Future _openImagePicker() async {
    XFile? pick = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
    return pick?.path.split('/').last;
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }

  void Clear() {
    firstname.clear();
    lastname.clear();
    dob.clear();
    passportnumber.clear();
    address.clear();
    phonenumber.clear();
    travelingfrom.clear();
    howmanyperson.clear();
    anymedical.clear();
    emergencycontactname.clear();
    emergencycontactnumber.clear();
    howdidyouhear.clear();
    areyouvaccinated.clear();
    uploadpassport.clear();
    uploadgreencard.clear();
    uploadid.clear();
  }
}

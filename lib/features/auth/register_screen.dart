import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/common/widgets/horizontal_space.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/theme_color_textformfield.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/auth/services/sign_up_service.dart';

import 'widgets/add_profile_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController mothername = TextEditingController();
  TextEditingController presentAddress = TextEditingController();
  TextEditingController permeanentAddress = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController monthlyIncome = TextEditingController();
  TextEditingController nid = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nomineeName = TextEditingController();
  TextEditingController nomineeBirthday = TextEditingController();
  TextEditingController nomineeRelation = TextEditingController();
  TextEditingController nomineeContact = TextEditingController();
  TextEditingController savingsPresent = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController academicQualification = TextEditingController();

  DateTime? dob;

  File? imageFile;
  File? signatureImage;
  File? nomineeImage;
  File? nomineeSignatureImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Register", context: context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(),
            const VerticalSpace(height: 20),
            const Text("Create a Puja Ltd account."),
            const VerticalSpace(height: 10),
            const Divider(
              color: themeColor,
            ),
            VerticalSpace(height: getHeight(context) * 2),
            ThemeColorTextFormField(
              icondata: Icons.card_membership,
              hint: "Name",
              textEditingController: name,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.text_fields,
              hint: "Father's Name",
              textEditingController: fathername,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.text_fields,
              hint: "Mother's Name",
              textEditingController: mothername,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.map,
              hint: "Present Address",
              textEditingController: presentAddress,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.map_outlined,
              hint: "Permanent address",
              textEditingController: permeanentAddress,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.badge,
              hint: "Occupation",
              textEditingController: occupation,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.attach_money_outlined,
              hint: "Monthly Income",
              textEditingController: monthlyIncome,
            ),
            const VerticalSpace(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      // minTime: DateTime(dob!.year, dob!.month, dob!.day),
                      maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                    debugPrint('change $date');
                  }, onConfirm: (date) {
                    debugPrint('confirm $date');
                    setState(() {
                      dob = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                leading: const Icon(Icons.punch_clock),
                title: dob == null
                    ? const Text("Date of birth")
                    : Text("${dob?.day} - ${dob!.month} - ${dob!.year}"),
              ),
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.book,
              hint: "Academic Qualification",
              textEditingController: academicQualification,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.numbers,
              hint: "NID",
              textEditingController: nid,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.mobile_friendly,
              hint: "Contact No",
              textEditingController: contactNo,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.password,
              hint: "Password",
              textEditingController: password,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.email,
              hint: "Email",
              textEditingController: email,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.maps_ugc_sharp,
              hint: "Nominee Name",
              textEditingController: nomineeName,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.family_restroom,
              hint: "Nominee Relation",
              textEditingController: nomineeRelation,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.phone_android_sharp,
              hint: "Nominee Contacts",
              textEditingController: nomineeContact,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.energy_savings_leaf_rounded,
              hint: "Savings Present",
              textEditingController: savingsPresent,
            ),
            const VerticalSpace(height: 10),
            ThemeColorTextFormField(
              icondata: Icons.personal_injury_rounded,
              hint: "Religion",
              textEditingController: religion,
            ),
            const VerticalSpace(height: 10),
            Row(
              children: [
                imageFile == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(Icons.add_a_photo),
                        ),
                      )
                    : Image.file(
                        imageFile!,
                        height: 100,
                        width: 100,
                      ),
                const HorizontalSpace(width: 5),
                TextButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: const Text("Add a profile image"),
                )
              ],
            ),
            const VerticalSpace(height: 10),
            Row(
              children: [
                signatureImage == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(Icons.add_a_photo),
                        ),
                      )
                    : Image.file(
                        signatureImage!,
                        height: 100,
                        width: 100,
                      ),
                const HorizontalSpace(width: 5),
                TextButton(
                  onPressed: () {
                    pickSignatureImage();
                  },
                  child: const Text("Add an image of your signature"),
                )
              ],
            ),
            const VerticalSpace(height: 10),
            Row(
              children: [
                nomineeImage == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(Icons.add_a_photo),
                        ),
                      )
                    : Image.file(
                        nomineeImage!,
                        height: 100,
                        width: 100,
                      ),
                const HorizontalSpace(width: 5),
                TextButton(
                  onPressed: () {
                    pickNomineeImage();
                  },
                  child: const Text("Add nominee image"),
                )
              ],
            ),
            const VerticalSpace(height: 10),
            Row(
              children: [
                nomineeSignatureImage == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(Icons.add_a_photo),
                        ),
                      )
                    : Image.file(
                        nomineeSignatureImage!,
                        height: 100,
                        width: 100,
                      ),
                const HorizontalSpace(width: 5),
                TextButton(
                  onPressed: () {
                    pickNomineeSignatureImage();
                  },
                  child: const Text("Add nominee signature image"),
                )
              ],
            ),
            const VerticalSpace(height: 20),
            RoundButtonWidget(
                labelText: "Register",
                backgroundColor: buttonColor,
                function: () {
                  SignUpService().signUp(
                      name: name.text,
                      fatherName: fathername.text,
                      motherName: mothername.text,
                      presentAddress: presentAddress.text,
                      permanentAddress: permeanentAddress.text,
                      occupation: occupation.text,
                      monthlyIncome: monthlyIncome.text,
                      dob: dob.toString(),
                      academicQ: academicQualification.text,
                      nid: nid.text,
                      contactNo: contactNo.text,
                      password: password.text,
                      email: email.text,
                      nomineeName: nomineeName.text,
                      nomineeDob: "nomineeDob",
                      nomineeRelation: nomineeRelation.text,
                      nomineeContact: nomineeContact.text,
                      savingsPresent: savingsPresent.text,
                      religion: religion.text,
                      image: imageFile!,
                      signatureImage: signatureImage!,
                      nomineeImage: nomineeImage!,
                      nomineeSignature: nomineeSignatureImage!);
                }),
            VerticalSpace(height: getHeight(context) * 5),
          ],
        ),
      )),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        imageFile = temp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future pickSignatureImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        signatureImage = temp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future pickNomineeImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        nomineeImage = temp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future pickNomineeSignatureImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        nomineeSignatureImage = temp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}

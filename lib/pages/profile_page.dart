import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController semesterController = TextEditingController();

  bool editProfile = false;
  String actionButton = 'Edit Profile';
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      tittle: 'Profile',
      automaticallyImplyLeading: true,
      mobileDefault: buildBody(),
      mobileHandset: buildBody(),
      mobileTablet: buildBody(),
      actions: [],
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: normalButton(
            onPressed: () {
              if (editProfile == false) {
                setState(() {
                  editProfile = true;
                  actionButton = 'Simpan';
                });
              } else {
                print('save');
                setState(() {
                  editProfile = false;
                  actionButton = 'Edit Profile';
                });
              }
            },
            child: boldText(text: actionButton)),
      ),
    );
  }

  buildBody({bool? web, bool? webSmall, bool? webMedium, bool? webLarge}) {
    double avatarSize = web == true ? 180 : 130;
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVer10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: avatarSize,
                    width: avatarSize,
                    child: CircleAvatar(
                      backgroundColor: textColor,
                    ),
                  ),
                ),
              ],
            ),
            spaceVer30,
            boldText(text: 'Nama', size: 15),
            field(
              controller: nameController,
              hintText: 'nama lengkap',
              enabled: editProfile,
            ),
            spaceVer10,
            boldText(text: 'Jenis Kelamin', size: 15),
            field(
              controller: genderController,
              hintText: 'Jenis Kelamin',
              enabled: false,
            ),
            spaceVer10,
            boldText(text: 'Tanggal Lahir', size: 15),
            field(
              controller: bornController,
              hintText: 'Tanggal Lahir',
              enabled: false,
            ),
            spaceVer10,
            boldText(text: 'Kelas', size: 15),
            field(
              controller: classController,
              hintText: 'Kelas',
              keyboardType: TextInputType.number,
              enabled: editProfile,
            ),
            spaceVer10,
            boldText(text: 'Jurusan', size: 15),
            field(
              controller: majorController,
              hintText: 'Jurusan',
              enabled: editProfile,
            ),
            spaceVer10,
            boldText(text: 'Sekolah', size: 15),
            field(
              controller: schoolController,
              hintText: 'Sekolah',
              enabled: editProfile,
            ),
            spaceVer10,
            boldText(text: 'Semester', size: 15),
            field(
              controller: semesterController,
              hintText: 'Semester',
              keyboardType: TextInputType.number,
              enabled: editProfile,
            ),
            spaceVer10,
            spaceVer50,
            spaceVer50,
          ],
        ),
      ),
    );
  }
}

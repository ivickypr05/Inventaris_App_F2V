import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icony/icony_ikonate.dart';
import 'package:inventaris_app/app/modules/home/views/home_view.dart';
import 'package:inventaris_app/app/utils/widget/Stock.dart';
import 'package:ionicons/ionicons.dart';
import 'package:icony/icony.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/widget/TotalItem.dart';
import '../../../utils/widget/form.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final user = FirebaseAuth.instance.currentUser!;

  //documents IDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  ProfileView({super.key});

  @override
  void initState() {
    getDocIds();
  }

  @override
  Widget build(BuildContext context) {
    var profileInfo =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 125,
          width: 125,
          margin: const EdgeInsets.only(top: 15),
          child: Stack(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Ikonate(
                    Ikonate.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      if (user.displayName != null)
        Text(
          user.displayName!,
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
        )
      else
        Text(
          'Username',
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      const SizedBox(
        height: 5,
      ),
      Text(
        user.email!,
        style: GoogleFonts.montserrat(fontSize: 15),
      ),
    ]);

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        profileInfo,
        const SizedBox(
          width: 10,
        ),
      ],
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            header,
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      TotalItem(),
                      SizedBox(
                        width: 10,
                      ),
                      Stock(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 25),
                    height: 80,
                    width: 335,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(199, 14, 35, 94),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("object");
                            ProfileView();
                          },
                          child: Obx(() => Text(
                                '${FormNUM.convertToIdr(addController.saldo.toInt(), 2)}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(98, 144, 142, 1),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        Text(
                          ' Setting',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    signOut();
                    addController.clear();
                  },
                  child: Container(
                    height: 50,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(98, 144, 142, 1),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          Text(
                            ' Sign Out',
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

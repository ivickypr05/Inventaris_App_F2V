import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/home/views/home_view.dart';

import '../../auth/views/auth_view.dart';
import '../../items/views/items_view.dart';
import '../controllers/home_controller.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return HomeView();
        } else {
          return const AuthView();
        }
      }),
    ));
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/widget/History.dart';
import '../../../utils/widget/Item.dart';
import '../../../utils/widget/Saldo.dart';
import '../../../utils/widget/Stock.dart';
import '../../../utils/widget/TotalItem.dart';
import '../../../utils/widget/TransaksiTerakhir.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SingleChildScrollView(
        child: (SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100, top: 10, bottom: 10),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      if (user.displayName != null)
                        Text(
                          'Welcome ' + user.displayName!,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      else
                        Text('Welcome User!'),
                    ])),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 2),
                    child: Column(
                      children: [
                        TotalItem(),
                        SizedBox(height: 5),
                        Stock(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Center(
                    child: Saldo(),
                  )
                ],
              ),
              Column(),
              const SizedBox(height: 30),
              const TransaksiTerakhir(),
              const SizedBox(height: 30),
              const Item(),
              const SizedBox(
                height: 10,
              ),
              const History()
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:app_ecommerce/controller/auth_controller.dart';
import 'package:app_ecommerce/controller/controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../const.dart';
import '../../model/user.dart';
import 'auth/sign_in_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future<ImageProvider<Object>> getImage(String url) async {
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return NetworkImage(url);
      } else {
        return AssetImage('assets/user_image.png');
      }
    } catch (e) {
      return AssetImage('assets/user_image.png');
    }
  }

  User? getUser() => Hive.box("user").get('user');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 36,
                child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "${GETIMAGEURL}${getUser()?.imageName}&width=125&height=125&keepRatio=true")),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    ("${getUser()?.firstName} ${getUser()?.lastName}"),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          Text(
            ("Email: ${getUser()?.email ?? ""}"),
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          Text(("Phone Number: ${getUser()?.phoneNumber ?? ""}"),
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 10),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          Text(("Company: ${getUser()?.companyName ?? ""}"),
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 10),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          Text(("Role: ${getUser()?.roleName ?? ""}"),
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 10),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          const SizedBox(height: 50),
          buildAccountCard(
              title: "Sign Out",
              onClick: () {
                // show massage box to confirm sign out
                Get.defaultDialog(
                    title: "Sign Out",
                    middleText: "Are you sure you want to sign out?",
                    textConfirm: "Yes",
                    textCancel: "No",
                    buttonColor: Color(0xFF13027D),
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                      Get.find<AuthController>().signOut().then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen())));
                    },
                    onCancel: () => ());
                // authController.signOut().then((value) => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SignInScreen())));
              }),
        ],
      ),
    );
  }

  Widget buildAccountCard(
      {required String title, required Function() onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0.1,
                  blurRadius: 7,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:complusone_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
// import '../../component/main_header.dart';
import 'components/contact_list.dart';
import 'components/contact_loading_grid.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await contactController.pullRefresh();
            },
            child: Column(
              children: [
                // const MainHeader(),
                Expanded(child: Obx(() {
                  if (contactController.isContactLoading.value) {
                    return const ContactLoadingGrid();
                  } else {
                    if (contactController.contactList.isNotEmpty) {
                      return ContactGrid(
                          contact: contactController.contactList);
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/No data-pana.png'),
                          const SizedBox(height: 10),
                          const Text('Contact Not Found!')
                        ],
                      );
                    }
                  }
                })),
              ],
            ),
          ),
        ));
  }
}

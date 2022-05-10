import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/widgets/bottom_nav_bar.dart';
import 'package:hotel_book/widgets/drawer.dart';

import '../controller/home_controller.dart';

class Services extends StatelessWidget {
  Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Colors.yellow[900],
      ),
      bottomNavigationBar: const BottomNavigation(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListTileTheme(
          contentPadding: const EdgeInsets.all(15),
          iconColor: Colors.red,
          textColor: Colors.black54,
          style: ListTileStyle.list,
          dense: true,
          child: controller.services.isEmpty
              ? const Center(
                  child: Text('No data founded'),
                )
              : ListView.builder(
                  itemCount: controller.services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          '${controller.services[index].name}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('tap to make services'),
                        trailing: Text(
                          '${controller.services[index].price}',
                          style: const TextStyle(color: Color(0xFFe6b56c)),
                        ),
                        onTap: () {
                          controller.makeService(
                              controller.services[index].price!,
                              controller.services[index].name!);
                        },
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  List services = [
    {"name": "Room Clean", "price": "200\$"},
    {"name": "Food Order", "price": "500\$"},
  ];
}

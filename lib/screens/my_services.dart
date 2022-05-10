import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/controller/all_data_controller.dart';

class MyServices extends StatelessWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Services'),
          backgroundColor: Colors.yellow[900],
        ),
        body: ListTileTheme(
          contentPadding: EdgeInsets.all(10),
          textColor: Colors.black54,
          // tileColor: Colors.yellow[100],
          style: ListTileStyle.list,
          dense: true,
          child: GetX<AllData>(
            builder: (controller) {
              return controller.myServices.isEmpty
                  ? const Center(
                      child: Text('No data founded'),
                    )
                  : ListView.builder(
                      itemCount: controller.myServices.length,
                      itemBuilder: (_, index) => Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('${controller.myServices[index].name}'),
                          subtitle: Text(
                              'Room No: ${controller.myServices[index].roomNo}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  controller.deleteService(
                                    controller.myServices[index].id!,
                                    controller.myServices[index].roomNo!,
                                    controller.myServices[index].price!,
                                  );
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
        ));
  }
}

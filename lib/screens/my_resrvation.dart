import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/controller/all_data_controller.dart';
import 'package:hotel_book/screens/edit_resrvation.dart';
import 'package:hotel_book/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class MyResrvation extends StatelessWidget {
  const MyResrvation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resrvation'),
        backgroundColor: Colors.yellow[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<AllData>(
          builder: (logic) {
            return logic.resrvations.isEmpty
                ? const Center(
                    child: Text('No data founded'),
                  )
                : ListView.builder(
                    itemCount: logic.resrvations.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        // color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Room No: ${logic.resrvations[index].number}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Days: ${logic.resrvations[index].days}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Resrvation Date: ${DateFormat.yMd().format(logic.resrvations[index].date!)}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Resrvation Out Date: ${DateFormat.yMd().format(logic.resrvations[index].last!)}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GetBuilder<AllData>(
                                    builder: (_) {
                                      return CustomTextButton(
                                        lable: 'Edit',
                                        ontap: () {
                                          _.day.text = logic
                                              .resrvations[index].days!
                                              .toString();
                                          _.time =
                                              logic.resrvations[index].date!;
                                          Get.to(() => EditResrviation(
                                              data1: logic.resrvations[index]));
                                        },
                                        //   logic.editResrvation(
                                        //       context,
                                        //       logic.resrvations[index].id!,
                                        //       logic.resrvations[index].constPrice!,
                                        //       logic.resrvations[index].days!,
                                        //       logic.resrvations[index].number!,
                                        //       logic.resrvations[index].date!);
                                        // },
                                        color: Colors.yellow[900]!,
                                      );
                                    },
                                  ),
                                  CustomTextButton(
                                    lable: 'Delete',
                                    ontap: () {
                                      logic.deleteResrvation(
                                          logic.resrvations[index].id!,
                                          logic.resrvations[index].number!);
                                    },
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}

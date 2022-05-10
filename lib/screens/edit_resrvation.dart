import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/controller/all_data_controller.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class EditResrviation extends StatelessWidget {
  const EditResrviation({Key? key, required this.data1}) : super(key: key);
  final dynamic data1;

  @override
  Widget build(BuildContext context) {
    AllData controller = Get.find();
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Resrvation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<AllData>(
          builder: (logic) {
            return Form(
              key: logic.formKey,
              child: Column(
                children: [
                  CustomTextField(
                      controller: controller.day,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "please add days";
                        }
                        return null;
                      },
                      lable: '${data1.days} Days!! did you need more',
                      icon: const Icon(Icons.numbers),
                      input: TextInputType.number),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<AllData>(
                    builder: (logic) {
                      return Text(
                          'Time:${DateFormat.yMd().format(logic.time.toString().isEmpty ? data1.date : logic.time)}');
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<AllData>(
                    builder: (logic) {
                      return TextButton(
                        onPressed: () {
                          logic.getDatetime(context);
                        },
                        child: const Text(
                          ' Change time ',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: height / 65,
                              bottom: height / 65,
                              left: width / 10,
                              right: width / 10)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow[900]!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      side: BorderSide(
                                          color: Colors.yellow[900]!))),
                        ),
                      );
                    },
                  ),
                  GetBuilder<AllData>(
                    builder: (logic) {
                      return CustomTextButton(
                          lable: 'save',
                          ontap: () async {
                            logic.editResrvation(
                                data1.number, data1.id, data1.constPrice);
                          },
                          color: Colors.yellow[900]!);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/controller/home_controller.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    this.data1,
  }) : super(key: key);
  final dynamic data1;
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Hero(
              tag: Image.network(
                'src',
                fit: BoxFit.fill,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(17),
                            bottomRight: Radius.circular(17)),
                        image: DecorationImage(
                          image: NetworkImage(data1.image),
                          fit: BoxFit.fill,
                        )),
                    height: data.size.height * 0.5,
                    // child: Image.network(
                    //
                    // ),
                  ),
                  SizedBox(
                    height: data.size.height * 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(17),
                            bottomRight: Radius.circular(17)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: data.size.height * 0.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.07, vertical: height * .07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 0,
                      bottom: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // ignore: prefer_adjacent_string_concatenation
                            "Type: ${data1.type}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Price: ${data1.price}\$  ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Description: ${data1.description}  ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          // alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(15),
          child: Container(
            // height: data.size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Form(
                // key: logic.formKey2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                        controller: controller.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add filed';
                          }
                          return null;
                        },
                        lable: 'Resrvation by ',
                        icon: const Icon(Icons.person),
                        input: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: controller.day,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please add filed';
                          }
                          return null;
                        },
                        lable: 'Number Of Days',
                        icon: const Icon(Icons.numbers),
                        input: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Resrvation Date:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GetBuilder<HomeController>(
                          id: 'time',
                          builder: (logic) {
                            return Text(DateFormat.yMd().format(logic.time));
                          },
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        controller.getDatetime(context);
                      },
                      child: const Text(' Change date '),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            top: height / 65,
                            bottom: height / 65,
                            left: width / 10,
                            right: width / 10)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(19, 26, 44, 1.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                    side: const BorderSide())),
                      ),
                    ),
                    CustomTextButton(
                      lable: 'Reservation',
                      ontap: () {
                        controller.makeResrviation(
                            data1.type, data1.number, data1.price,data1.id);
                      },
                      color: Colors.yellow[900]!,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

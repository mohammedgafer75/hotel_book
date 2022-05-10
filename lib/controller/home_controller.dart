import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/widgets/custom_button.dart';

import '../model/room_model.dart';
import '../model/service_model.dart';
import '../widgets/loading.dart';
import '../widgets/snackbar.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<Rooms> rooms = RxList<Rooms>([]);
  RxList<Service> services = RxList<Service>([]);
  late TextEditingController name, type, price, day, number;
  DateTime time = DateTime.now();
  late CollectionReference collectionReference;
  late CollectionReference collectionReference2;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  auth.User? user;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  @override
  void onInit() {
    user = FirebaseAuth.instance.currentUser;
    collectionReference = firebaseFirestore.collection("room");
    collectionReference2 = firebaseFirestore.collection("service");
    name = TextEditingController();
    price = TextEditingController();
    type = TextEditingController();
    day = TextEditingController();
    number = TextEditingController();
    rooms.bindStream(getAllRooms());
    services.bindStream(getAllService());
    loading.value = true;
    super.onInit();
  }

  Stream<List<Rooms>> getAllRooms() => collectionReference
      .snapshots()
      .map((query) => query.docs.map((item) => Rooms.fromMap(item)).toList());
  Stream<List<Service>> getAllService() => collectionReference2
      .snapshots()
      .map((query) => query.docs.map((item) => Service.fromMap(item)).toList());

  makeResrviation(String type, int number, int price) {
    showdilog();
    DateTime last = time.add(Duration(days: int.tryParse(day.text)!));
    var re = <String, dynamic>{
      "uid": user!.uid,
      "name": name.text,
      "type": type,
      "number": number,
      "date": time,
      "days": int.tryParse(day.text),
      "last": last,
      "constPrice": price,
      "price": price * int.tryParse(day.text)!
    };
    firebaseFirestore
        .collection("resrvation")
        .doc()
        .set(re)
        .whenComplete(() async {
      await firebaseFirestore.collection('mybills').doc().set({
        "uid": user!.uid,
        "roomNo": number,
        "time": time,
        "last": last,
        "constPrice": price,
        "resrvationPrice": price * int.tryParse(day.text)!,
        "ServicesPrice": 0,
        "days": int.tryParse(day.text),
        "servicesCount": 0,
      });
      Get.back();
      showbar("Resrvation Added", "Resrvation Added", "Resrvation added", true);
      name.clear();
      day.clear();
    }).catchError((error) {
      Get.back();
      showbar("Error", "Error", error.toString(), false);
    });
  }

  void getDatetime(BuildContext context) {
    BottomPicker.dateTime(
      title: "choose time",
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
      onSubmit: (date) {
        time = date;
        update(['time']);
      },
      onClose: () {},
      buttonText: 'Confirm',
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonSingleColor: Colors.pink,
      minDateTime: DateTime.now(),
    ).show(context);
  }

  makeService(int price, String name) async {
    var res = await firebaseFirestore
        .collection('resrvation')
        .where('uid', isEqualTo: user!.uid)
        .get();
    if (res.docs.isNotEmpty) {
      List<String> roomsNo = [];
      for (var element in res.docs) {
        roomsNo.add(element['number'].toString());
      }
      String roomNo = roomsNo[0];
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'select room',
        content: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.BOTTOM_SHEET,
              showSelectedItems: true,
              items: roomsNo,
              dropdownSearchDecoration: const InputDecoration(
                labelText: "Room number",
                hintText: "select Room number",
              ),
              onChanged: (value) {
                roomNo = value!;
              },
              selectedItem: roomsNo[0],
            ),
            CustomTextButton(
                lable: 'save',
                ontap: () async {
                  showdilog();
                  var re = <String, dynamic>{
                    "uid": user!.uid,
                    "name": name,
                    "price": price,
                    "roomNo": int.tryParse(roomNo)
                  };
                  firebaseFirestore
                      .collection("myservice")
                      .doc()
                      .set(re)
                      .whenComplete(() async {
                    var res = await firebaseFirestore
                        .collection('mybills')
                        .where('roomNo', isEqualTo: int.tryParse(roomNo))
                        .where('uid', isEqualTo: user!.uid)
                        .get();
                    await firebaseFirestore
                        .collection('mybills')
                        .doc(res.docs[0].id)
                        .update({
                      "servicesCount": res.docs[0]['servicesCount'] + 1,
                      "ServicesPrice": res.docs[0]['ServicesPrice'] + price
                    });
                    Get.back();
                    Get.back();
                    showbar("Service Added", "Service Added", "Service added",
                        true);
                  }).catchError((error) {
                    Get.back();
                    showbar("Error", "Error", error.toString(), false);
                  });
                },
                color: Colors.yellow[900]!),
            CustomTextButton(
                lable: 'close',
                ontap: () {
                  Get.back();
                },
                color: Colors.yellow[900]!)
          ],
        ),
      );
    } else {
      showbar("Error", "Error",
          'You do not have a room, please reserve a room ', false);
    }
  }
}

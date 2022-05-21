import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book/controller/home_controller.dart';
import 'package:hotel_book/widgets/bottom_nav_bar.dart';
import 'package:hotel_book/widgets/drawer.dart';

import '../controller/all_data_controller.dart';
import '../widgets/feature_item.dart';
import 'details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    final width = data.size.width;
    final height = data.size.height;
    Get.put(AllData());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.yellow[900],
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavigation(),
        drawer: AppDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                // margin: const EdgeInsets.only(top: 20),
                height: 460,
                child: getFeature(context),
              )
            ],
          ),
        ));
  }

  getFeature(BuildContext context) {
    final data = MediaQuery.of(context);

    final width = data.size.width;
    final height = data.size.height;
    return GetX<HomeController>(
      builder: (logic) {
        return logic.rooms.isEmpty
            ? const Center(
                child: Text('No data founded'),
              )
            : CarouselSlider(
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  height: height,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: .75,
                ),
                items: List.generate(
                  logic.rooms.length,
                  (index) => Hero(
                    tag: Image.network(
                      'src',
                      fit: BoxFit.fill,
                    ),
                    child: FeatureItem(
                      data: logic.rooms[index],
                      onTap: () {
                        Get.to(() => Details(
                              data1: logic.rooms[index],
                            ));
                      },
                    ),
                  ),
                ),
              );
      },
    );
  }
}

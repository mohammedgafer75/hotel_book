// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../widgets/custom_button.dart';
// import '../widgets/custom_textfield.dart';
// import '../widgets/feature_item.dart';
// import 'details.dart';
// class HotelPage extends StatelessWidget {
//   HotelPage({Key? key, this.data1,
//
//   })
//       : super(key: key);
//   final dynamic data1;
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController test = TextEditingController();
//     final data = MediaQuery.of(context);
//     final width = data.size.width;
//     final height = data.size.height;
//     return Scaffold(
//         body:  ListView(
//           children: [
//             Stack(
//               children: [
//                 Hero(
//                   tag: Image.network('src',fit: BoxFit.fill,),
//                   child: Stack(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(17),
//                                 bottomRight: Radius.circular(17)),
//                             image: DecorationImage(
//                               image: NetworkImage(data1["image"]), fit: BoxFit.fill,)
//                         ),
//                         height: data.size.height * 0.5,
//                         // child: Image.network(
//                         //
//                         // ),
//                       ),
//                       SizedBox(
//                         height: data.size.height * 0.5,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(17),
//                                 bottomRight: Radius.circular(17)),
//                             gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 Colors.transparent,
//                                 Colors.black.withOpacity(0.7),
//                               ],
//                             ),
//                           ),
//
//                         ),
//
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: data.size.height * 0.50,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: width * 0.07, vertical: height *
//                             .07),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: const Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.white,
//                                 size: 24,
//                               ),
//                             ),
//                             Text(
//                               "Grand Hotel " ,
//                               style: const TextStyle(
//                                 color: Colors.orangeAccent,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Expanded(
//                       //   child: Container(),
//                       // ),
//                       // Padding(
//                       //   padding: EdgeInsets.symmetric(
//                       //     horizontal: width * .07,
//                       //   ),
//                       //   child: Container(
//                       //     width: width * 0.5,
//                       //     height: height * 0.06,
//                       //     padding: const EdgeInsets.symmetric(
//                       //       vertical: 4,
//                       //     ),
//                       //     child: Center(
//                       //       child:
//                       //     ),
//                       //   ),
//                       // ),
//
//                       const Spacer(),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//
//               // alignment: Alignment.bottomCenter,
//               padding: const EdgeInsets.all(15),
//               child: Container(
//                 // height: data.size.height,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child:  getFeature()
//
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
//   getFeature() {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 300,
//         enlargeCenterPage: true,
//         disableCenter: true,
//         viewportFraction: .75,
//       ),
//       items: List.generate(
//         features.length,
//             (index) => Hero(
//           tag: Image.network('src',fit: BoxFit.fill,),
//           child: FeatureItem(
//             data: features[index],
//             onTapFavorite: () {
//               // setState(() {
//               //   features[index]["is_favorited"] =
//               //   !features[index]["is_favorited"];
//               // });
//             },
//             onTap: () {
//               Get.to(()=>Details(data1: features[index],));
//             },
//           ),
//         ),
//       ),
//     );
//   }
//   List features = [
//     {
//       "id": 100,
//       "name": "Superior Room",
//       "image":
//       "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       "price": "\$210",
//       "type": 'Single Room',
//       "rate": "4.5",
//       "location": "Phnom Penh",
//       "is_favorited": false,
//       "album_images": [
//         "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       ],
//       "description":
//       "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     },
//     {
//       "id": 101,
//       "name": "Junior Suite",
//       "image":
//       "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       "price": "\$150",
//       "type": 'Single Room',
//       "rate": "4.5",
//       "location": "Phnom Penh",
//       "is_favorited": true,
//       "album_images": [
//         "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       ],
//       "description":
//       "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     },
//     {
//       "id": 102,
//       "name": "Classic Queen Room",
//       "image":
//       "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       "price": "\$320",
//       "type": 'Single Room',
//       "rate": "4.5",
//       "location": "Phnom Penh",
//       "is_favorited": false,
//       "album_images": [
//         "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       ],
//       "description":
//       "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     },
//     {
//       "id": 103,
//       "name": "Luxury King",
//       "image":
//       "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       "price": "\$350",
//       "type": 'Single Room',
//       "rate": "4.5",
//       "location": "Phnom Penh",
//       "is_favorited": false,
//       "album_images": [
//         "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       ],
//       "description":
//       "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     },
//     {
//       "id": 104,
//       "name": "Classic Room",
//       "image":
//       "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       "price": "\$180",
//       "type":'Single Room',
//       "rate": "4.5",
//       "location": "Phnom Penh",
//       "is_favorited": false,
//       "album_images": [
//         "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       ],
//       "description":
//       "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     },
//     {
//       "id": 105,
//       "name": "Twin Room",
//       "image":
//       "https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       "price": "\$250",
//       "type": 'Single Room',
//       "rate": "4.5",
//       "location": "Phnom Penh",
//       "is_favorited": false,
//       "album_images": [
//         "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//         "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//       ],
//       "description":
//       "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     },
//   ];
//
// }

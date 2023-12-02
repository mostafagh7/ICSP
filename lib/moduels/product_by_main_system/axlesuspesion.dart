// import 'package:e_commerce/moduels/search/search_model.dart';
// import '../../../Widget/colors.dart';
// import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class AxleSuspesionPage extends StatefulWidget {
//   const AxleSuspesionPage({super.key});

//   @override
//   State<AxleSuspesionPage> createState() => _AxleSuspesionPageState();
// }

// class _AxleSuspesionPageState extends State<AxleSuspesionPage> {
//   ProductModel controllerAxleSuspesion = Get.find();

//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     if (controllerAxleSuspesion.allProduct.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.grey[800],
//           elevation: 0,
//           title: const Text(
//             "Axle Suspesion",
//           ),
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
//           ],
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Lottie.asset("assets/json/comingsoon.json"),
//         ),
//       );
//     } else {
//       return Scaffold(
//         backgroundColor: Colors.grey[300],
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.grey[800],
//           elevation: 0,
//           title: const Text(
//             "Axle Suspesion",
//           ),
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
//           ],
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Expanded(
//                 child: ListView.builder(
//                     itemCount: controllerAxleSuspesion.allProduct.length,
//                     itemBuilder: (context, index) => ListTile(
//                           onTap: () {
//                             Get.to(
//                               ProductDetailsPage(
//                                   product: controllerAxleSuspesion
//                                       .allProduct[index]),
//                             );
//                           },
//                           contentPadding: const EdgeInsets.all(8),
//                           title: Text(
//                             controllerAxleSuspesion.allProduct[index]
//                                     ["name"]
//                                 .toString(),
//                             style: TextStyle(
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Text(
//                             "Car Brand: ${controllerAxleSuspesion.allProduct[index]["carbrand"].toString()}",
//                             style: TextStyle(
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           trailing: Text(
//                             "Model: ${controllerAxleSuspesion.allProduct[index]["model"].toString()}",
//                             style: TextStyle(color: primaryColor),
//                           ),
//                           leading: controllerAxleSuspesion
//                                       .allProduct[index]["pic"]
//                                       .toString() ==
//                                   ""
//                               ? Image.asset(
//                                   "assets/images/Disks.webp",
//                                   height: 100,
//                                   width: 100,
//                                 )
//                               : Image.network(
//                                   controllerAxleSuspesion
//                                       .allProduct[index]["pic"]
//                                       .toString(),
//                                   height: 100,
//                                   width: 100,
//                                 ),
//                         ))),
//           ],
//         ),
//       );
//     }
//   }
// }

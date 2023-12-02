// import 'package:e_commerce/moduels/search/search_model.dart';
// import '../../../../Widget/colors.dart';
// import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class WindScreenPage extends StatefulWidget {
//   const WindScreenPage({super.key});

//   @override
//   State<WindScreenPage> createState() => _WindScreenPageState();
// }

// class _WindScreenPageState extends State<WindScreenPage> {
//   ProductModel controllerWindScreen = Get.find();

//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     if (controllerWindScreen.allProduct.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.grey[800],
//           elevation: 0,
//           title: const Text(
//             "Windscreen Cleaning System",
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
//     }else {
//       return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.grey[800],
//         elevation: 0,
//         title: const Text(
//           "Windscreen Cleaning System",
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
//         ],
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   itemCount: controllerWindScreen.allProduct.length,
//                   itemBuilder: (context, index) => ListTile(
//                         onTap: () {
//                           Get.to(
//                             ProductDetailsPage(
//                                 product: controllerWindScreen.allProduct[index]),
//                           );
//                         },
//                         contentPadding: const EdgeInsets.all(8),
//                         title: Text(
//                           controllerWindScreen.allProduct[index]["name"].toString(),
//                           style: TextStyle(
//                               color: primaryColor, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           "Car Brand: ${controllerWindScreen.allProduct[index]["carbrand"].toString()}",
//                           style: TextStyle(
//                               color: primaryColor, fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           "Model: ${controllerWindScreen.allProduct[index]["model"].toString()}",
//                           style: TextStyle(color: primaryColor),
//                         ),
//                         leading:
//                             controllerWindScreen.allProduct[index]["pic"].toString() ==
//                                     ""
//                                 ? Image.asset(
//                                     "assets/images/Disks.webp",
//                                     height: 100,
//                                     width: 100,
//                                   )
//                                 : Image.network(
//                                     controllerWindScreen.allProduct[index]["pic"]
//                                         .toString(),
//                                     height: 100,
//                                     width: 100,
//                                   ),
//                       ))),
//         ],
//       ),
//     );
//     }
//   }
// }

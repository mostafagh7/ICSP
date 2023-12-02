// import 'package:e_commerce/moduels/search/search_model.dart';
// import '../../../../Widget/colors.dart';
// import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class DisksPage extends StatefulWidget {
//   const DisksPage({super.key});

//   @override
//   State<DisksPage> createState() => _DisksPageState();
// }

// class _DisksPageState extends State<DisksPage> {
//   ProductModel controllerDisks = Get.find();

//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     if(controllerDisks.allProduct.isEmpty){
//       return Scaffold(
//         appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.grey[800],
//         elevation: 0,
//         title: const Text(
//           "Disks",
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
//         ],
//         centerTitle: true,
//       ),
//         body: Center(
//           child: Lottie.asset("assets/json/comingsoon.json"),
//         ),
//       );
//     } else {
//       return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.grey[800],
//         elevation: 0,
//         title: const Text(
//           "Disks",
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
//                   itemCount: controllerDisks.allProduct.length,
//                   itemBuilder: (context, index) => ListTile(
//                         onTap: () {
//                           Get.to(
//                             ProductDetailsPage(
//                                 product:
//                                     controllerDisks.allProduct[index]),
//                           );
//                         },
//                         contentPadding: const EdgeInsets.all(8),
//                         title: Text(
//                           controllerDisks.allProduct[index]["name"]
//                               .toString(),
//                           style: TextStyle(
//                               color: primaryColor, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           "Car Brand: ${controllerDisks.allProduct[index]["carbrand"].toString()}",
//                           style: TextStyle(
//                               color: primaryColor, fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           "Model: ${controllerDisks.allProduct[index]["model"].toString()}",
//                           style: TextStyle(color: primaryColor),
//                         ),
//                         leading: controllerDisks.allProduct[index]["pic"]
//                                     .toString() ==
//                                 ""
//                             ? Image.asset(
//                                 "assets/images/Disks.webp",
//                                 height: 100,
//                                 width: 100,
//                               )
//                             : Image.network(
//                                 controllerDisks.allProduct[index]["pic"]
//                                     .toString(),
//                                 height: 100,
//                                 width: 100,
//                               ),
//                       ))),
//         ],
//       ),
//     );
//     }
//   }
// }

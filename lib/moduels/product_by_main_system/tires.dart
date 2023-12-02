// import 'package:e_commerce/moduels/search/search_model.dart';
// import '../../../../Widget/colors.dart';
// import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class TiresPage extends StatefulWidget {
//   const TiresPage({super.key});

//   @override
//   State<TiresPage> createState() => _TiresPageState();
// }

// class _TiresPageState extends State<TiresPage> {
//   ProductModel controllerTires = Get.find();

//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     if (controllerTires.allProduct.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.grey[800],
//           elevation: 0,
//           title: const Text(
//             "Tires",
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
//           "Tires",
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
//                   itemCount: controllerTires.allProduct.length,
//                   itemBuilder: (context, index) => ListTile(
//                         onTap: () {
//                           Get.to(
//                             ProductDetailsPage(
//                                 product: controllerTires.allProduct[index]),
//                           );
//                         },
//                         contentPadding: const EdgeInsets.all(8),
//                         title: Text(
//                           controllerTires.allProduct[index]["name"].toString(),
//                           style: TextStyle(
//                               color: primaryColor, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           "Car Brand: ${controllerTires.allProduct[index]["carbrand"].toString()}",
//                           style: TextStyle(
//                               color: primaryColor, fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           "Model: ${controllerTires.allProduct[index]["model"].toString()}",
//                           style: TextStyle(color: primaryColor),
//                         ),
//                         leading:
//                             controllerTires.allProduct[index]["pic"].toString() ==
//                                     ""
//                                 ? Image.asset(
//                                     "assets/images/Disks.webp",
//                                     height: 100,
//                                     width: 100,
//                                   )
//                                 : Image.network(
//                                     controllerTires.allProduct[index]["pic"]
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

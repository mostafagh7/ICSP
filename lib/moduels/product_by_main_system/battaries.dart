// import 'package:e_commerce/moduels/search/search_model.dart';
// import '../../../Widget/colors.dart';
// import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class BattariesPage extends StatefulWidget {
//   const BattariesPage({super.key});

//   @override
//   State<BattariesPage> createState() => _BattariesPageState();
// }

// class _BattariesPageState extends State<BattariesPage> {
//   ProductModel controllerbattaries = Get.find();

//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     if (controllerbattaries.allProduct.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.grey[800],
//           elevation: 0,
//           title: const Text(
//             "battaries",
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
//             "battaries",
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
//                     itemCount: controllerbattaries.allProduct.length,
//                     itemBuilder: (context, index) => ListTile(
//                           onTap: () {
//                             Get.to(
//                               ProductDetailsPage(
//                                   product:
//                                       controllerbattaries.allProduct[index]),
//                             );
//                           },
//                           contentPadding: const EdgeInsets.all(8),
//                           title: Text(
//                             controllerbattaries.allProduct[index]["name"]
//                                 .toString(),
//                             style: TextStyle(
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Text(
//                             "Series: ${controllerbattaries.allProduct[index]["series"].toString()}",
//                             style: TextStyle(
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           trailing: Text(
//                             "voltage: ${controllerbattaries.allProduct[index]["voltage"].toString()}",
//                             style: TextStyle(color: primaryColor),
//                           ),
//                           leading: controllerbattaries.allProduct[index]
//                                           ["pic"]
//                                       .toString() ==
//                                   ""
//                               ? Image.asset(
//                                   "assets/images/Disks.webp",
//                                   height: 100,
//                                   width: 100,
//                                 )
//                               : Image.network(
//                                   controllerbattaries.allProduct[index]["pic"]
//                                       .toString(),
//                                   height: 100,
//                                   width: 100,
//                                 ),
//                         ))),
//           ],
//         ),
//         // floatingActionButton: FloatingActionButton(onPressed: () {
//         //   showModalBottomSheet(
//         //       backgroundColor: Colors.indigo[50],
//         //       isScrollControlled: true,
//         //       context: context,
//         //       builder: (context) => SingleChildScrollView(
//         //             child: Container(
//         //               padding: EdgeInsets.only(
//         //                   bottom: MediaQuery.of(context).viewInsets.bottom),
//         //               child: Column(
//         //                 children: [
//         //                   Padding(
//         //                     padding: const EdgeInsets.all(16),
//         //                     child: Center(
//         //                       child: Text(
//         //                         "Add New Battaries",
//         //                         style: GoogleFonts.robotoSlab(
//         //                             textStyle: const TextStyle(
//         //                                 fontSize: 30, color: Colors.black54)),
//         //                       ),
//         //                     ),
//         //                   ),
//         //                   Padding(
//         //                     padding: const EdgeInsets.all(25.0),
//         //                     child: Column(
//         //                       children: [
//         //                         Padding(
//         //                           padding: const EdgeInsets.all(8.0),
//         //                           child: TextField(
//         //                             decoration: InputDecoration(
//         //                               labelText: 'Name',
//         //                               labelStyle:
//         //                                   const TextStyle(color: Colors.black54),
//         //                               enabledBorder: const OutlineInputBorder(
//         //                                   borderSide:
//         //                                       BorderSide(color: Colors.black)),
//         //                               suffixIcon: Icon(
//         //                                 Icons.person,
//         //                                 color: Colors.indigo[100],
//         //                               ),
//         //                             ),
//         //                             onChanged: (value1) {
//         //                               controllerbattaries.nametoadd =
//         //                                   value1.toUpperCase();
//         //                             },
//         //                           ),
//         //                         ),
//         //                         Padding(
//         //                           padding: const EdgeInsets.all(8.0),
//         //                           child: TextField(
//         //                             decoration: InputDecoration(
//         //                               labelText: 'Series',
//         //                               labelStyle:
//         //                                   const TextStyle(color: Colors.black54),
//         //                               enabledBorder: const OutlineInputBorder(
//         //                                   borderSide:
//         //                                       BorderSide(color: Colors.black)),
//         //                               suffixIcon: Icon(
//         //                                 Icons.person,
//         //                                 color: Colors.indigo[100],
//         //                               ),
//         //                             ),
//         //                             onChanged: (value2) {
//         //                               controllerbattaries.seriestoadd =
//         //                                   value2.toUpperCase();
//         //                             },
//         //                           ),
//         //                         ),
//         //                         Padding(
//         //                           padding: const EdgeInsets.all(8.0),
//         //                           child: TextField(
//         //                             decoration: InputDecoration(
//         //                               labelText: 'Voltage',
//         //                               labelStyle:
//         //                                   const TextStyle(color: Colors.black54),
//         //                               enabledBorder: const OutlineInputBorder(
//         //                                   borderSide:
//         //                                       BorderSide(color: Colors.black)),
//         //                               suffixIcon: Icon(
//         //                                 Icons.person,
//         //                                 color: Colors.indigo[100],
//         //                               ),
//         //                             ),
//         //                             onChanged: (value3) {
//         //                               controllerbattaries.voltagetoadd =
//         //                                   value3.toUpperCase();
//         //                             },
//         //                           ),
//         //                         ),
//         //                         Padding(
//         //                           padding: const EdgeInsets.all(8.0),
//         //                           child: TextField(
//         //                             decoration: InputDecoration(
//         //                               labelText: 'pic',
//         //                               labelStyle:
//         //                                   const TextStyle(color: Colors.black54),
//         //                               enabledBorder: const OutlineInputBorder(
//         //                                   borderSide:
//         //                                       BorderSide(color: Colors.black)),
//         //                               suffixIcon: Icon(
//         //                                 Icons.person,
//         //                                 color: Colors.indigo[100],
//         //                               ),
//         //                             ),
//         //                             onChanged: (value4) {
//         //                               controllerbattaries.pictoadd = value4.toUpperCase();
//         //                             },
//         //                           ),
//         //                         ),
//         //                         ElevatedButton.icon(
//         //                           style: ButtonStyle(
//         //                             padding: MaterialStateProperty.all<
//         //                                 EdgeInsetsGeometry>(
//         //                               const EdgeInsets.all(5),
//         //                             ),
//         //                           ),
//         //                           label: loading
//         //                               ? const CircularProgressIndicator(
//         //                                   color: Colors.white,
//         //                                 )
//         //                               : Text(
//         //                                   "Upload Image",
//         //                                   style: GoogleFonts.robotoSlab(
//         //                                       textStyle: const TextStyle(
//         //                                           fontSize: 15,
//         //                                           color: Colors.black54)),
//         //                                 ),
//         //                           icon: Icon(
//         //                             Icons.image,
//         //                             color: Colors.indigo[100],
//         //                           ),
//         //                           onPressed: () async {
//         //                             setState(() {
//         //                               loading = true;
//         //                             });
//         //                             await controllerbattaries.sendimage();
//         //                             setState(() {
//         //                               loading = false;
//         //                             });
//         //                           },
//         //                         ),
//         //                         ElevatedButton.icon(
//         //                           icon: Icon(
//         //                             Icons.electrical_services_sharp,
//         //                             color: Colors.indigo[100],
//         //                           ),
//         //                           label: Text(
//         //                             "Save",
//         //                             style: GoogleFonts.robotoSlab(
//         //                                 textStyle: const TextStyle(
//         //                                     fontSize: 15, color: Colors.black54)),
//         //                           ),
//         //                           onPressed: () async {
//         //                             controllerbattaries.senddata();
//         //                           },
//         //                         )
//         //                       ],
//         //                     ),
//         //                   )
//         //                 ],
//         //               ),
//         //             ),
//         //           ));
//         // }),
//       );
//     }
//   }
// }

import 'dart:convert';

import 'package:Ess_Conn/Application/ProfileProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/Domain/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';

class PaymentRough extends StatelessWidget {
  PaymentRough({
    Key? key,
  }) : super(key: key);

  var kheight20;
  var kheight;

  @override
  Widget build(BuildContext context) {
    //  Provider.of<ProfileProvider>(context, listen: false).profileData();
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 2,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: FutureBuilder<StudProModel>(
                    future: ProfileProvider().getProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Text(
                                snapshot.data!.studentDetails.studentPhoto.path)
                          ],
                        );
                      } else {
                        return Text('Loading...');
                      }
                    }),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            // Flashnews()
          ],
        ),
      ),
    );
  }
} 

  // _displayNameOfSiblings(BuildContext context, String? name) async {
  //   final siblings = Provider.of<ProfileProvider>(context, listen: false);
  //   siblings.siblingsAPI();
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //             content: Container(
  //           decoration: BoxDecoration(border: Border.all()),
  //           height: 70,
  //           child: ListView.separated(
  //               separatorBuilder: (BuildContext context, int index) =>
  //                   const Divider(),
  //               itemCount:
  //                   siblinggResponse == null ? 0 : siblinggResponse!.length,
  //               itemBuilder: ((context, index) {
  //                 return Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Center(
  //                         child: GestureDetector(
  //                             onTap: () async {
  //                               var idd = siblinggResponse![index]['id'] == null
  //                                   ? '--'
  //                                   : siblinggResponse![index]['id'].toString();

  //                               await Provider.of<SibingsProvider>(context,
  //                                       listen: false)
  //                                   .getSibling(context, idd);
  //                             },
  //                             child: Text(
  //                                 siblinggResponse![index]['name'] == null
  //                                     ? '--'
  //                                     : siblinggResponse![index]['name']
  //                                         .toString()))),
  //                     const Divider(
  //                       height: 1,
  //                       color: Colors.black54,
  //                     )
  //                   ],
  //                 );
  //               })),
  //         ));
  //       });
  // }



























// import 'package:Ess_Conn/Application/FeesProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';

// class PaymentRough extends StatefulWidget {
//   const PaymentRough({Key? key}) : super(key: key);

//   @override
//   State<PaymentRough> createState() => _PaymentRoughState();
// }

// class _PaymentRoughState extends State<PaymentRough> {
//   List _selecteCategorys = [];

//   Map<String, dynamic> _categories = {
//     "responseCode": "1",
//     "responseText": "List categories.",
//     "responseBody": [
//       {"category_id": "5", "category_name": "Barber"},
//       {"category_id": "3", "category_name": "Carpanter"},
//       {"category_id": "7", "category_name": "Cook"}
//     ],
//     "responseTotalResult":
//         3 // Total result is 3 here becasue we have 3 categories in responseBody.
//   };

//   void _onCategorySelected(bool selected, category_id) {
//     if (selected == true) {
//       setState(() {
//         _selecteCategorys.add(category_id);
//       });
//     } else {
//       setState(() {
//         _selecteCategorys.remove(category_id);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//       ),
//       body: Consumer<FeesProvider>(
//         builder: (context, value, child) {
//           return ListView.builder(
//               itemCount: feeResponse == null ? 0 : feeResponse!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return CheckboxListTile(
//                   value: _selecteCategorys.contains(
//                       _categories['responseBody'][index]['category_id']),
//                   onChanged: (bool? selected) {
//                     _onCategorySelected(selected!,
//                         _categories['responseBody'][index]['category_id']);
//                   },
//                   title:
//                       Text(feeResponse![index]['installmentNetDue'].toString()),
//                   secondary: Text(feeResponse![index]['installmentName']),
//                 );
//               });
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Application/StudentProviders/FeesProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class PayFee extends StatelessWidget {
  PayFee({Key? key}) : super(key: key);

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Payment'),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.2,
            toolbarOpacity: 0.8,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            backgroundColor: UIGuide.light_Purple,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: UIGuide.light_Purple,
              indicatorWeight: 0.1,
              tabs: [
                Tab(
                  text: "Installment",
                ),
                Consumer<FeesProvider>(builder: ((context, value, child) {
                  if (value.allowPartialPayment == false) {
                    return Tab(
                      text: 'Partial',
                    );
                  } else {
                    return Text('');
                  }
                }))
                //Tab(text: "Partial "),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FeePayInstallment(),
              Consumer<FeesProvider>(builder: ((context, value, child) {
                if (value.allowPartialPayment == false) {
                  return FeePartialPayment();
                }
                return Text('');
              }))
            ],
          )),
    );
  }
}

class FeePayInstallment extends StatefulWidget {
  const FeePayInstallment({Key? key}) : super(key: key);

  @override
  State<FeePayInstallment> createState() => _FeePayInstallmentState();
}

class _FeePayInstallmentState extends State<FeePayInstallment> {
  final ScrollController _controller = ScrollController();

  final ScrollController _controller2 = ScrollController();

  final List _selecteCategorys = [];

  double totalFees = 0;

  void _selectAll(int index) {
    _selecteCategorys.addAll(feeResponse![index]['installmentNetDue']);
  }

  void _onFeeSelected(bool selected, feeName, int index, feeNetDue) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(feeName);
        print(index);
        final double tot = feeResponse![index]['installmentNetDue'];
        print(feeName);
        print(tot);
        totalFees = tot + totalFees;
        print(totalFees);
        total = totalFees + totalBusFee;
        print(total);
      });
    } else {
      setState(() {
        // _selecteCategorys.remove(fee_Name);
        // print('removed  $fee_Name');
        // final double tot = feeResponse![index]['installmentNetDue'];
        // print(fee_Name);
        // print(tot);
        // totalFees = tot - totalFees;
        // print('totalFees: $totalFees');
        if (_selecteCategorys.remove(feeName)) {
          final double tot = feeResponse![index]['installmentNetDue'];
          totalFees = totalFees - tot;
          total = totalFees + totalBusFee;
          print(total);
        }
      });
    }
  }

  //bus fee
  final List _selectedBusFee = [];

  double totalBusFee = 0;

  void _onBusSelected(bool selected, busfeeName, int index, feeNetDue) {
    if (selected == true) {
      setState(() {
        _selectedBusFee.add(busfeeName);
        print(index);
        final double tot = busfeeResponse![index]['installmentNetDue'];
        print(busfeeName);
        print(tot);
        totalBusFee = tot + totalBusFee;
        print(totalBusFee);
        total = totalFees + totalBusFee;
        print(total);
      });
    } else {
      setState(() {
        if (_selectedBusFee.remove(busfeeName)) {
          final double tot = busfeeResponse![index]['installmentNetDue'];
          totalBusFee = totalBusFee - tot;
          total = totalFees + totalBusFee;
          print(total);
        }
      });
    }
  }

  double? total = 0;

  void totalFee() async {
    setState(() {
      total = totalFees + totalBusFee;
      print(total);
    });
  }

  bool enable = true;
  @override
  Widget build(BuildContext context) {
    // final _provider = Provider.of<FeesProvider>(context, listen: false);
    // _provider.feesData();
    Provider.of<FeesProvider>(context).feesData();
    return Stack(
      children: [
        ListView(
          children: [
            kheight20,
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Installment',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: UIGuide.light_Purple),
                  ),
                  Consumer<FeesProvider>(builder: (context, snap, child) {
                    //   child:
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Checkbox(
                        value: snap.isselectAll,
                        onChanged: (bool? value) {
                          setState(() {
                            value = snap.isselectAll;
                          });
                        },
                        //       },
                      ),
                    );
                  }),
                ],
              ),
            ),
            Scrollbar(
              controller: _controller,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 8),
                child: LimitedBox(
                    maxHeight: 160,
                    child:
                        //  Consumer<FeesProvider>(
                        //   builder: (context, value, child) {
                        //     return
                        ListView.builder(
                            shrinkWrap: true,
                            controller: _controller,
                            itemCount:
                                feeResponse == null ? 0 : feeResponse!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                activeColor:
                                    const Color.fromARGB(255, 238, 236, 236),
                                checkColor: UIGuide.light_Purple,
                                selectedTileColor: UIGuide.light_Purple,
                                value: _selecteCategorys.contains(
                                    feeResponse![index]['installmentName']),
                                onChanged: (bool? selected) async {
                                  // selected == true;

                                  // for (int i = 0; i <= feeResponse!.length; i++) {
                                  //   _onFeeSelected(
                                  //       selected!,
                                  //       feeResponse![index]['installmentName'],
                                  //       index,
                                  //       feeResponse![index]['installmentNetDue']);
                                  //   print(selected);
                                  // }
                                  //   if (index == 0) {
                                  //  enable = true;
                                  _onFeeSelected(
                                      selected!,
                                      feeResponse![index]['installmentName'],
                                      index,
                                      feeResponse![index]['installmentNetDue']);
                                  print(selected);
                                  // }
                                  // await index == 0 && selected == true;
                                  // else if (index == 1 && enable == false) {
                                  //   _onFeeSelected(
                                  //       selected!,
                                  //       feeResponse![index]['installmentName'],
                                  //       index,
                                  //       feeResponse![index]
                                  //           ['installmentNetDue']);
                                  //   print(selected);
                                  // }
                                },
                                title: Text(
                                  feeResponse![index]['installmentNetDue']
                                      .toString(),
                                  textAlign: TextAlign.end,
                                ),
                                secondary: Text(
                                    feeResponse![index]['installmentName']),
                              );
                            })

                    // return ListView.builder(
                    //   shrinkWrap: true,
                    //   controller: _controller,
                    //   itemCount: feeResponse == null
                    //       ? 0
                    //       : feeResponse!.length,
                    //   itemBuilder: ((context, index) {
                    //     return Table(
                    //       //  border: TableBorder.all(),
                    //       children: [
                    //         TableRow(
                    //             decoration: const BoxDecoration(
                    //                 // color: Color.fromARGB(
                    //                 //     255, 230, 227, 227),
                    //                 ),
                    //             children: [
                    //               Text(
                    //                   "\n${feeResponse![index]['installmentName']}"),
                    //               Center(
                    //                   child: Text(
                    //                       '\n${feeResponse![index]['installmentNetDue'].toString()}')),
                    //               Center(child: CheckBoxButton()),
                    //             ]),
                    //       ],
                    //     );
                    //   }),
                    // );
                    //   },
                    // ),
                    ),
              ),
              thumbVisibility: true,
              thickness: 6,
              radius: Radius.circular(20),
            ),
            Center(
              child: Text(
                'TotalFee:  $totalFees',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: Text(
                'Bus Fee',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: UIGuide.light_Purple),
              ),
            ),
            Scrollbar(
              controller: _controller2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 8),
                child: LimitedBox(
                    maxHeight: 280,
                    child:
                        // Consumer<FeesProvider>(
                        //   builder: (context, value, child) {
                        //     return
                        ListView.builder(
                            shrinkWrap: true,
                            controller: _controller2,
                            itemCount: busfeeResponse == null
                                ? 0
                                : busfeeResponse!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                activeColor:
                                    const Color.fromARGB(255, 238, 236, 236),
                                checkColor: UIGuide.light_Purple,
                                selectedTileColor: UIGuide.light_Purple,
                                value: _selectedBusFee.contains(
                                    busfeeResponse![index]['installmentName']),
                                onChanged: (bool? selected) {
                                  _onBusSelected(
                                      selected!,
                                      busfeeResponse![index]['installmentName'],
                                      index,
                                      busfeeResponse![index]
                                          ['installmentNetDue']);
                                  print(selected);
                                },
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 75),
                                  child: Text(
                                    busfeeResponse![index]['installmentNetDue']
                                        .toString(),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                secondary: Text(
                                    busfeeResponse![index]['installmentName']),
                              );
                            })
                    // return ListView.builder(
                    //     shrinkWrap: true,
                    //     controller: _controller2,
                    //     itemCount: busfeeResponse == null
                    //         ? 0
                    //         : busfeeResponse!.length,
                    //     itemBuilder: ((context, index) {
                    //       return Table(
                    //         //  border: TableBorder.all(),
                    //         children: [
                    //           TableRow(children: [
                    //             Text(
                    //                 '\n${busfeeResponse![index]['installmentName']}'),
                    //             Center(
                    //                 child: Text(
                    //                     '\n${busfeeResponse![index]['installmentNetDue'].toString()}')),
                    //             const Center(
                    //                 child: CheckBoxButton()),
                    //           ]),
                    //         ],
                    //       );
                    //     }));
                    //   },
                    // )
                    ),
              ),
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(20),
            ),
            Center(
              child: Text(
                'TotalBus fee :  $totalBusFee',
                style: TextStyle(fontSize: 12),
              ),
            ),
            kheight20,
            kheight20,
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total : ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  // totalFee()
                  Text(total.toString())
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: MaterialButton(
              height: 60,
              onPressed: () {},
              child: const Text(
                'Proceed to Pay',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
              ),
              color: UIGuide.light_Purple,
            ),
          ),
        ),
      ],
    );
  }
}

class FeePartialPayment extends StatelessWidget {
  FeePartialPayment({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  final ScrollController _controller2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    Provider.of<FeesProvider>(context, listen: false).feesData();
    return Stack(
      children: [
        ListView(
          children: [
            kheight20,
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'Installment',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: UIGuide.light_Purple),
              ),
            ),
            Scrollbar(
              controller: _controller,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 8),
                child: LimitedBox(
                  maxHeight: 160,
                  child: Consumer<FeesProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        controller: _controller,
                        itemCount:
                            feeResponse == null ? 0 : feeResponse!.length,
                        itemBuilder: ((context, index) {
                          return Table(
                            //  border: TableBorder.all(),
                            children: [
                              TableRow(
                                  decoration: const BoxDecoration(
                                      // color: Color.fromARGB(
                                      //     255, 230, 227, 227),
                                      ),
                                  children: [
                                    Text(
                                        "\n${feeResponse![index]['installmentName']}"),
                                    Center(
                                        child: Text(
                                            '\n${feeResponse![index]['installmentNetDue'].toString()}')),
                                    Center(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.remove_red_eye,
                                              size: 20,
                                              color: Colors.grey,
                                            ))),
                                  ]),
                            ],
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
              thumbVisibility: true,
              thickness: 6,
              radius: Radius.circular(20),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: Text(
                'Bus Fee',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: UIGuide.light_Purple),
              ),
            ),
            Scrollbar(
              controller: _controller2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 8),
                child: LimitedBox(
                    maxHeight: 280,
                    child: Consumer<FeesProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                            shrinkWrap: true,
                            controller: _controller2,
                            itemCount: busfeeResponse == null
                                ? 0
                                : busfeeResponse!.length,
                            itemBuilder: ((context, index) {
                              return Table(
                                //  border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    Text(
                                        '\n${busfeeResponse![index]['installmentName']}'),
                                    Center(
                                        child: Text(
                                            '\n${busfeeResponse![index]['installmentNetDue'].toString()}')),
                                    Center(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.grey,
                                              size: 20,
                                            ))),
                                  ]),
                                ],
                              );
                            }));
                      },
                    )),
              ),
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(20),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, bottom: 100),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 213, 215, 218),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: UIGuide.light_Purple, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Amount Paying",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Amount Paying',
                    labelStyle: const TextStyle(color: UIGuide.light_Purple)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the amount';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: MaterialButton(
              height: 50,
              onPressed: () {},
              child: const Text(
                'Proceed to Pay',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
              ),
              color: UIGuide.light_Purple,
            ),
          ),
        ),
      ],
    );
  }
}

// class CheckBoxButton extends StatefulWidget {
//   const CheckBoxButton({Key? key}) : super(key: key);

//   @override
//   State<CheckBoxButton> createState() => _CheckBoxButtonState();
// }

// class _CheckBoxButtonState extends State<CheckBoxButton> {
//   bool _ischecked = false;
//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.blue;
//       }
//       return UIGuide.light_Purple;
//     }

//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       value: _ischecked,
//       onChanged: (bool? value) {
//         setState(() {
//           _ischecked = value!;
//         });
//       },
//     );
//   }
// }

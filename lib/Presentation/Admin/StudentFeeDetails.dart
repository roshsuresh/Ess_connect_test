import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';

class StudentFeeSearch extends StatelessWidget {
  StudentFeeSearch({Key? key}) : super(key: key);
  final List<String> _items = [
    'LP',
    'HS',
    'HSS',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Fee Report'),
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 50.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    child: ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          // snap.removeCourseAll();
                          return ListTile(
                            selectedTileColor: Colors.blue.shade100,
                            selectedColor: UIGuide.PRIMARY2,
                            //  selected: _items.[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudFeeDetails()),
                              );
                            },
                            title: Text('class'),
                          );
                        }));
              });
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            // controller: courseController,
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Select Name",
            ),
            enabled: false,
          ),
        ),
      ),
    );
  }
}

class StudFeeDetails extends StatelessWidget {
  const StudFeeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Fee Report'),
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 50.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 224, 224),
                    borderRadius: BorderRadius.circular(10)),
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name : ',
                          ),
                          Text(
                            'AAADAM ISWAR',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Division : ',
                          ),
                          Text(
                            'VII-A',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Roll No : ',
                              ),
                              Text(
                                '1245',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            kheight10,
            const Center(
              child: Text(
                'FeeDue List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, style: BorderStyle.solid)),
              width: size.width,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 233, 206, 238),
                    child: const Text(
                      'School Fees',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(4),
                      2: FlexColumnWidth(4),
                    },
                    children: const [
                      TableRow(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 228, 224, 224),
                          ),
                          children: [
                            SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Installment',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'NetDue',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Paid Amount',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                            ),
                          ]),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Table(
                          columnWidths: {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(4),
                          },
                          children: const [
                            TableRow(
                                decoration: BoxDecoration(
                                  //  border: Border.all(),
                                  color: Colors.white,
                                ),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'Term 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '5000.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '0.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ]),
                          ],
                        );
                      })),
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 228, 227, 228),
                    child: Center(
                      child: Text(
                        'Total NetDue : 12000',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 233, 206, 238),
                    child: const Text(
                      'Bus Fees',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Table(
                          columnWidths: const {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(4),
                          },
                          children: const [
                            TableRow(
                                decoration: BoxDecoration(
                                  //  border: Border.all(),
                                  color: Colors.white,
                                ),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'Term 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '5000.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '0.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ]),
                          ],
                        );
                      })),
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 228, 227, 228),
                    child: Center(
                      child: Text(
                        'Total NetDue : 12000',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kheight20,
            Center(
              child: Text(
                'Fee Paid Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, style: BorderStyle.solid)),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 233, 206, 238),
                    child: Text(
                      'School Fees',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Table(
                    columnWidths: {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(4),
                      2: FlexColumnWidth(4),
                    },
                    children: const [
                      TableRow(
                          decoration: BoxDecoration(
                            //  border: Border.all(),
                            color: Color.fromARGB(255, 228, 224, 224),
                          ),
                          children: [
                            SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Installment',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'NetDue',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Paid Amount',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                            ),
                          ]),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Table(
                          columnWidths: const {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(4),
                          },
                          children: const [
                            TableRow(
                                decoration: BoxDecoration(
                                  //  border: Border.all(),
                                  color: Colors.white,
                                ),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'Term 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '5300.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '5300.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ]),
                          ],
                        );
                      })),
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 228, 227, 228),
                    child: const Center(
                      child: Text(
                        'Total PaidAmount : 12000',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  ///Bus fee
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 233, 206, 238),
                    child: const Text(
                      'Bus Fees',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Table(
                          columnWidths: const {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(4),
                          },
                          children: const [
                            TableRow(
                                decoration: BoxDecoration(
                                  //  border: Border.all(),
                                  color: Colors.white,
                                ),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'Term 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '5300.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      '5300.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ]),
                          ],
                        );
                      })),
                  Container(
                    width: size.width,
                    color: Color.fromARGB(255, 228, 227, 228),
                    child: const Center(
                      child: Text(
                        'Total PaidAmount : 12000',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

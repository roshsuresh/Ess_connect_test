import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Column(
        children: [
          kheight10,
          Center(
            child: Container(
              height: 160,
              width: width - 120,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 250, 250),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListView(children: [
                RadioButtonForPayment(),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      view();
                      //  ViewPaymentHistory();
                    },
                    child: Text('👁️ View'),
                  ),
                )
              ]),
            ),
          ),
          kheight20,
          view(),
          //  ViewPaymentHistory(),
        ],
      ),
    );
  }
}

class RadioButtonForPayment extends StatefulWidget {
  const RadioButtonForPayment({Key? key}) : super(key: key);

  @override
  State<RadioButtonForPayment> createState() => _RadioButtonForPaymentState();
}

String _selected = 'Fees Payment';

class _RadioButtonForPaymentState extends State<RadioButtonForPayment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Radio<String>(
            value: 'Fees Payment',
            groupValue: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value!;
                print(value);
              });
            },
          ),
          title: const Text('Fees Payment'),
        ),
        ListTile(
          leading: Radio<String>(
            value: 'Advance Pay',
            groupValue: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value!;
                print(value);
              });
            },
          ),
          title: const Text('Advance Pay'),
        ),
      ],
    );
  }
}

// class ViewPaymentHistory extends StatelessWidget {
//   const ViewPaymentHistory({Key? key}) : super(key: key);

//   @override
// Widget build(BuildContext context) {

Widget view() {
  print('fgj');
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Table(
      //  border: TableBorder.all(),
      children: [
        const TableRow(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 196, 210, 235),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            children: [
              Center(child: Text('Bill No.')),
              Center(child: Text('Bill Date')),
              Center(child: Text('Amount \n paid')),
              Center(child: Text('Receipt'))
            ]),
        TableRow(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 227, 227),
            ),
            children: [
              Center(child: Text('\nar7875df')),
              Center(child: Text('\n18/10/2022')),
              Center(child: Text('\n2000')),
              IconButton(
                icon: Icon(Icons.download),
                onPressed: () {},
              )
            ]),
        TableRow(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 240, 240),
            ),
            children: [
              const Center(child: Text('\nar7875df')),
              const Center(child: Text('\n18/10/2022')),
              const Center(child: Text('\n2000')),
              IconButton(
                icon: Icon(Icons.download),
                onPressed: () {},
              )
            ]),
        TableRow(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 227, 227),
            ),
            children: [
              const Center(child: Text('\nar7875df')),
              const Center(child: Text('\n18/10/2022')),
              const Center(child: Text('\n2000')),
              IconButton(
                icon: Icon(Icons.download),
                onPressed: () {},
              )
            ]),
        TableRow(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 230, 227, 227),
          ),
          children: [
            const Center(child: Text('\nar7875df')),
            const Center(child: Text('\n18/10/2022')),
            const Center(child: Text('\n2000')),
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () {},
            )
          ],
        ),
      ],
    ),
  );
}

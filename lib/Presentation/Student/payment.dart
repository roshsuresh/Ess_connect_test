import 'package:Ess_Conn/Application/FeesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentRough extends StatefulWidget {
  const PaymentRough({Key? key}) : super(key: key);

  @override
  State<PaymentRough> createState() => _PaymentRoughState();
}

class _PaymentRoughState extends State<PaymentRough> {
  final List _selecteCategorys = [];
  double total = 0;
  void _onFeeSelected(bool selected, fee_Name, int index, fee_netDue) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(fee_Name);
        print(index);
        final double tot = feeResponse![index]['installmentNetDue'];
        print(fee_Name);
        print(tot);
        total = tot + total;
        print(total);
      });
    } else {
      setState(() {
        // _selecteCategorys.remove(fee_Name);
        // print('removed  $fee_Name');

        // final double tot = feeResponse![index]['installmentNetDue'];
        // print(fee_Name);
        // print(tot);
        // total = tot - total;
        // print('total: $total');

        if (_selecteCategorys.remove(fee_Name)) {
          final double tot = feeResponse![index]['installmentNetDue'];
          total = total - tot;
        }
      });
    }
  }

  void findTotal(double tot) async {
    total = total - tot;
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<FeesProvider>(context, listen: false).feesData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Consumer<FeesProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: feeResponse == null ? 0 : feeResponse!.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  value: _selecteCategorys
                      .contains(feeResponse![index]['installmentName']),
                  onChanged: (bool? selected) {
                    _onFeeSelected(
                        selected!,
                        feeResponse![index]['installmentName'],
                        index,
                        feeResponse![index]['installmentNetDue']);
                    print(selected);
                  },
                  title: Text(
                    feeResponse![index]['installmentNetDue'].toString(),
                    textAlign: TextAlign.center,
                  ),
                  secondary: Text(feeResponse![index]['installmentName']),
                );
              });
        },
      ),
    );
  }
}

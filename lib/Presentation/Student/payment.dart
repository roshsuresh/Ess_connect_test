import 'package:Ess_Conn/Application/FeesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class PaymentRough extends StatefulWidget {
  const PaymentRough({Key? key}) : super(key: key);

  @override
  State<PaymentRough> createState() => _PaymentRoughState();
}

class _PaymentRoughState extends State<PaymentRough> {
  List _selecteCategorys = [];

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Barber"},
      {"category_id": "3", "category_name": "Carpanter"},
      {"category_id": "7", "category_name": "Cook"}
    ],
    "responseTotalResult":
        3 // Total result is 3 here becasue we have 3 categories in responseBody.
  };

  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_id);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(category_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Consumer<FeesProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: feeResponse == null ? 0 : feeResponse!.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  value: _selecteCategorys.contains(
                      _categories['responseBody'][index]['category_id']),
                  onChanged: (bool? selected) {
                    _onCategorySelected(selected!,
                        _categories['responseBody'][index]['category_id']);
                  },
                  title:
                      Text(feeResponse![index]['installmentNetDue'].toString()),
                  secondary: Text(feeResponse![index]['installmentName']),
                );
              });
        },
      ),
    );
  }
}

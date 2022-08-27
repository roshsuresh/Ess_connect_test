import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AdvancePay extends StatelessWidget {
  const AdvancePay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advance Pay'),
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
      body: Center(
        child: Container(
          height: height - 450,
          width: width - 50,
          //color: Colors.black,
          decoration: const BoxDecoration(
              color: UIGuide.WHITE,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 128, 125, 125),
                  offset: Offset(
                    2,
                    5.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kheight10,
              const Text(
                'Online Advance Payment',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: UIGuide.light_Purple),
              ),
              kheight20,
              kheight20,
              const Text(
                'Balance in Your Wallet : 20000',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              kheight20,
              kheight20,
              const Text(
                'Paying amount',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              kheight10,
              const Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              kheight20,
              MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white),
                ),
                color: UIGuide.light_Purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}

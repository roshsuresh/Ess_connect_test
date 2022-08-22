import 'dart:ui';

import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class PayFee extends StatelessWidget {
  PayFee({Key? key}) : super(key: key);

  var size, height, width;
  final ScrollController _controller = ScrollController();
  final ScrollController _controller2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment'),
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
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _controller,
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return BusFee();
                    }),
                  ),
                ),
              ),
              thumbVisibility: true,
              // showTrackOnHover: true,
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
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _controller2,
                        itemCount: 10,
                        itemBuilder: ((context, index) {
                          return InstallmentPage();
                        }))),
              ),
              isAlwaysShown: true,
              showTrackOnHover: true,
              thickness: 6,
              radius: Radius.circular(20),
            ),
            // kheight20, kheight20,
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: MaterialButton(
                height: 60,
                onPressed: () {},
                child: Text(
                  'Proceed to Pay',
                  style: TextStyle(color: Colors.white),
                ),
                color: UIGuide.light_Purple,
              ),
            ),
            //kheight20
          ],
        ));
  }
}

class InstallmentPage extends StatelessWidget {
  const InstallmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: Text(
            'Term',
            style: TextStyle(fontSize: 16),
          ),
          title: Text(
            '2900',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          trailing: CheckBoxButton(),
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}

class BusFee extends StatelessWidget {
  const BusFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: Text(
            'January',
            style: TextStyle(fontSize: 16),
          ),
          title: Text(
            '290',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          trailing: CheckBoxButton(),
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}

class CheckBoxButton extends StatefulWidget {
  const CheckBoxButton({Key? key}) : super(key: key);

  @override
  State<CheckBoxButton> createState() => _CheckBoxButtonState();
}

class _CheckBoxButtonState extends State<CheckBoxButton> {
  bool _ischecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return UIGuide.light_Purple;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: _ischecked,
      onChanged: (bool? value) {
        setState(() {
          _ischecked = value!;
        });
      },
    );
  }
}

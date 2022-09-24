
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Constants.dart';
import '../../utils/constants.dart';

class StaffInfo extends StatelessWidget {
  const StaffInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 190,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 120,
                  decoration: const BoxDecoration(
                      color: UIGuide.light_Purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(450),
                          bottomRight: Radius.circular(450))),
                ),
                Positioned(
                  top: 60,
                  left: 100,
                  right: 100,
                  child: Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU')),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text('Name : '),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: const StrutStyle(fontSize: 13),
                        maxLines: 2,
                        text: const TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Color.fromARGB(255, 44, 43, 43)),
                            text: 'AADHITHYA'),
                      ),
                    ),
                  ],
                ),
                kheight10,
                Row(
                  children: const [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Designation : '),
                    Text(
                      'Teacher',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                kheight10,
                Row(
                  children: const [
                    Icon(
                      Icons.mobile_friendly,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Mobile Number : '),
                    Text(
                      '+91 9854467864',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                kheight10,
                Row(
                  children: const [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Email : '),
                    Text(
                      'aadhithya@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                kheight10,
                Row(
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Section : '),
                    Text(
                      '+91 9854467864',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                kheight10,
                Row(
                  children: [
                    Icon(
                      Icons.redeem_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Birthday : '),
                    Text(
                      '19 Jan',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                kheight10,
                Row(
                  children: [
                    Icon(
                      Icons.man_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Gender : '),
                    Text(
                      'Male',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                kheight10,
                Row(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Address : '),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: const StrutStyle(fontSize: 13),
                        maxLines: 3,
                        text: const TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color.fromARGB(255, 44, 43, 43)),
                            text:
                                'Reloaded 1 Reloaded 1 of 1770 libraries in 1,986ms (compile: 27 ms, reload: 861 ms, reassemble: 946 ms). of 1770 libraries in 1,986ms (compile: 27 ms, reload: 861 ms, reassemble: 946 ms).'),
                      ),
                    ),
                  ],
                ),
                kheight10,
              ],
            ),
          )
        ],
      ),
    );
  }
}

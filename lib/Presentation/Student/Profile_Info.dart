import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile_Info extends StatelessWidget {
  Profile_Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 79, 97, 197);
    final Color fill2 = Color.fromARGB(255, 180, 103, 216);
    final List<Color> gradient = [
      fill1,
      fill2,
      background,
      background,
    ];
    final double fillPercent = 35;
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 260,
                width: width,
                // color: UIGuide.WHITE,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradient,
                    stops: stops,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 30,
                right: 30,
                child: Container(
                    decoration: const BoxDecoration(
                        color: UIGuide.WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 128, 125, 125),
                            offset: Offset(
                              2,
                              5.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    width: width - 50,
                    height: 170,
                    child: Column(
                      children: [
                        kheight20,
                        kheight20,
                        kheight20,
                        kheight10,
                        const Text(
                          'Sidharth',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        kheight10,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            // defaultColumnWidth: FixedColumnWidth(120.0),
                            border: TableBorder.all(
                                color: Color.fromARGB(255, 213, 213, 243),
                                style: BorderStyle.solid,
                                width: 2),
                            children: [
                              TableRow(children: [
                                Column(
                                  children: const [
                                    Text('Class',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)),
                                    Text('VI - A',
                                        style: TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('Roll No',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)),
                                    Text('23',
                                        style: TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('Adm No',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)),
                                    Text('5354',
                                        style: TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                              ])
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/studentLogo.png',
                  ),
                  radius: 65,
                  backgroundColor: UIGuide.BLACK,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              height: 370,
              color: Color.fromARGB(255, 248, 240, 248),
              // Color.fromARGB(255, 207, 204, 207), // center container color
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      kWidth,
                      Icon(Icons.person_outline_outlined),
                      kWidth,
                      Text(
                        'Personal Info',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black,
                        //  height: 36,
                      )),
                  Table(
                    defaultColumnWidth: FixedColumnWidth(200.0),
                    children: [
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.cake_outlined,
                                    size: 22,
                                  ),
                                  kWidth,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '21 Jan 2022',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 43, 34, 158)),
                                      ),
                                      Text(
                                        'Birthday',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outlined,
                                        size: 22,
                                      ),
                                      kWidth,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Male',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 43, 34, 158)),
                                          ),
                                          Text(
                                            'Gender',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.bloodtype_outlined,
                                    size: 22,
                                  ),
                                  kWidth,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'AB +ve',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 43, 34, 158)),
                                      ),
                                      Text(
                                        'Blood Group',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.flag_outlined,
                                        size: 22,
                                      ),
                                      kWidth,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Red',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 43, 34, 158)),
                                          ),
                                          Text(
                                            'House Group',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.height_outlined,
                                    size: 22,
                                  ),
                                  kWidth,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '123 cm',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 43, 34, 158)),
                                      ),
                                      Text(
                                        'Height',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.line_weight_outlined,
                                        size: 22,
                                      ),
                                      kWidth,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '40 KG',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 43, 34, 158)),
                                          ),
                                          Text(
                                            'Weight',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.sticky_note_2_outlined,
                                    size: 22,
                                  ),
                                  kWidth,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sumi',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 43, 34, 158)),
                                      ),
                                      Text(
                                        'Class Teacher',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 22,
                                      ),
                                      kWidth,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Thrissur',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 43, 34, 158)),
                                          ),
                                          Text(
                                            'Birthplace',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              kheight10,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 210, 199, 240)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: width,
                      height: 115,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' Permenent Address',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 2.5,
                            ),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: const StrutStyle(fontSize: 11.5),
                                maxLines: 5,
                                text: const TextSpan(
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 43, 43)),
                                    text:
                                        'house number & details\n address details  near places \n near city,near location \n phone \n'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CarouselSlider(
            items: [
              Container(
                width: width,
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 210, 199, 240)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Father (Guardian)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 37, 37, 117)),
                    ),
                    //kheight10,
                    const Center(
                        child: Text(
                      "Ravidranath",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 14,
                        ),
                        Flexible(
                          //overflow
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(fontSize: 12.0),
                            text: const TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: 'Ravidranath@gmail.com'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 210, 199, 240)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Image.asset(
                              'assets/studentLogo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kheight10,
                            kheight10,
                            Row(
                              children: [
                                Icon(Icons.phone_android_outlined),
                                Text('+91 9564655156')
                              ],
                            ),
                            kheight10,
                            Row(
                              children: [
                                Icon(Icons.phone_android_outlined),
                                Text('+91 9564655156')
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color.fromARGB(255, 210, 199, 240)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mother',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 37, 37, 117)),
                    ),
                    //kheight10,
                    Center(
                        child: Text(
                      "Ravidranath",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 14,
                        ),
                        // Text(
                        //   'Ravidranath@gmail.com',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(fontSize: 12),
                        // )

                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: 'Ravidranath@gmail.com'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromARGB(255, 210, 199, 240)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset(
                              'assets/studentLogo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kheight10,
                            kheight10,
                            Row(
                              children: [
                                Icon(Icons.phone_android_outlined),
                                Text('+91 9564655156')
                              ],
                            ),
                            kheight10,
                            Row(
                              children: const [
                                Icon(Icons.phone_android_outlined),
                                Text('+91 9564655156')
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://miro.medium.com/max/1400/1*mbMlSNbnIC7nt2DCW38EIQ.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              //  autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

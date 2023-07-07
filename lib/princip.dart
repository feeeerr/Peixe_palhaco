import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class princip extends StatefulWidget {
  const princip({Key? key});

  @override
  State<princip> createState() => _principState();
}

class _principState extends State<princip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(70)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(70)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(70)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(70)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(70)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow(); // Disables scroll glow effect
                return true;
              },
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 20, top: 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Container(
                                      child: SvgPicture.asset(
                                        'assets/images/iconeBarbearia.svg',
                                        height: 100,
                                        width: 90,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              child: Text('Shell Sofa'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text('Tipo'),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '326Km',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    Icon(
                                                      Icons.call_made,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text('Aberto'),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

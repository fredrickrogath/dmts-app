import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   double frameHeight = 0;

  double frameWidth = 0;
  static const String defaultImagePath = 'assets/logo/logo.jpg';

@override
  Widget build(BuildContext context) {
     frameHeight = MediaQuery.of(context).size.height;

    frameWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: DraggableHome(
      leading: Icon(Icons.arrow_back_ios),
      title: Text("dmts"),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ],
      
      headerWidget: Container(
        color: const Color(0xFF337A6F),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: frameHeight / 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF24564F),
                          // radius: frameHeight >= 800
                          //     ? frameHeight / 19
                          //     : frameHeight / 23,
                          radius: 45.0,
                          child: ClipOval(
                            child: Image.asset('assets/logo2.jpg'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'DMTS',
                          style: TextStyle(
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // Add your onPressed code here
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          CupertinoIcons.bell,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                        Icon(
                          CupertinoIcons.circle_fill,
                          color: Color(0xFFC1292E),
                          size: 11.0,
                        ),
                      ],
                    ),
                    backgroundColor: const Color(0xFF337A6F),
                    elevation: 2.0,
                  ),
                ],
              ),
              SizedBox(
                height: frameHeight / 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF337A6F),
                          border: Border.all(
                            color: const Color(0xFF337A6F),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: SizedBox(
                        height: frameHeight / 9,
                        width: frameWidth / 2.0,
                        child: OpenContainer(
                          closedColor: Colors.white,
                          openColor: const Color(0xFF337A6F),
                          closedElevation: 5.0,
                          openElevation: 0.0,
                          closedShape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration: const Duration(milliseconds: 100),
                          openBuilder: (context, action) {
                           
                            return const Text( 'dmts',
                            );
                          },
                          closedBuilder: (context, action) {
                            // FocusScope.of(context).requestFocus(FocusNode());
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Today's sales",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                      const Text(
                                        'Mauzo ya leo',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          'Tsh. 120,300',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_upward,
                                        size: frameWidth * 0.05,
                                        color: Colors.green,
                                      ),
                                      const Text(
                                        '10%',
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF337A6F),
                          border: Border.all(
                            color: const Color(0xFF337A6F),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: SizedBox(
                        height: frameHeight / 9,
                        width: frameWidth / 2.5,
                        child: OpenContainer(
                          closedColor: Colors.white,
                          openColor: const Color(0xFF337A6F),
                          closedElevation: 5.0,
                          openElevation: 0.0,
                          closedShape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration: const Duration(milliseconds: 100),
                          openBuilder: (context, action) {
                            return  Text(
                              'dmts',
                            );
                          },
                          closedBuilder: (context, action) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Stock out',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: frameWidth * 0.05),
                                ),
                                const Text(
                                  'Bidhaa zilizouzwa',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    ': 103',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: frameWidth * 0.04),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: frameHeight / 90,
              ),
              SizedBox(
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text(
                        'Add item',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: const Color(0xFF337A6F),
                        primary: const Color(0xFF337A6F),
                        shape: const StadiumBorder(),
                        elevation: 10,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text(
                        'All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary:Colors.white,
                        shape: const StadiumBorder(),
                        elevation: 10,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text(
                        'Products',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary:  Colors.white,
                        primary: Colors.white,
                        shape: const StadiumBorder(),
                        elevation: 10,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Services',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:  Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary:  const Color(0xFF337A6F),
                        shape: const StadiumBorder(),
                        elevation: 10,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
      headerBottomBar: headerBottomBarWidget(),
      body: [
        SizedBox(height: frameHeight/40.0,),

        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 150,
              height: frameHeight/5.7,
              child: OpenContainer(
                closedColor: Colors.white12,
                openColor: const Color(0xFF004B23),
                closedElevation: 0.0,
                openElevation: 0.0,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, action) {
                  return const Text('data');
                },
                closedBuilder: (context, action) {
                  return Column(children: [
                    SizedBox(
                        height: 120.0,
                        child: Lottie.asset('assets/profile.json')),
                    const Text(
                      'My Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ]);
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: frameHeight/5.7,
              child: OpenContainer(
                closedColor: Colors.white12,
                openColor: const Color(0xFF004B23),
                closedElevation: 0.0,
                openElevation: 0.0,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 700),
                openBuilder: (context, action) {
                  return const Text('data');
                },
                closedBuilder: (context, action) {
                  return Column(children: [
                    Lottie.asset('assets/results.json'),
                    const Text(
                      'Daily details',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ]);
                },
              ),
            ),
          ]),

          SizedBox(height: frameHeight/25.0,),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 150,
              height: frameHeight/5.7,
              child: OpenContainer(
                closedColor: Colors.white12,
                openColor: const Color(0xFF004B23),
                closedElevation: 0.0,
                openElevation: 0.0,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, action) {
                  return const Text('data');
                },
                closedBuilder: (context, action) {
                  return Column(children: [
                    SizedBox(
                        height: 120.0,
                        child: Lottie.asset('assets/report.json',
                            fit: BoxFit.contain)),
                    const Text(
                      'Report',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ]);
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: frameHeight/5.7,
              child: OpenContainer(
                closedColor: Colors.white12,
                openColor: const Color(0xFF004B23),
                closedElevation: 0.0,
                openElevation: 0.0,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, action) {
                  return const Text('data');
                },
                closedBuilder: (context, action) {
                  return Column(children: [
                    SizedBox(
                        height: 120.0,
                        child: Lottie.asset('assets/recommendations.json')),
                    const Text(
                      'Recommendations',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ]);
                },
              ),
            ),
          ]),

          SizedBox(height: frameHeight/25.0,),

          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 150,
              height: frameHeight/5.7,
              child: OpenContainer(
                closedColor: Colors.white12,
                openColor: const Color(0xFF004B23),
                closedElevation: 0.0,
                openElevation: 0.0,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, action) {
                  return const Text('data');
                },
                closedBuilder: (context, action) {
                  return Column(children: [
                    SizedBox(
                        height: 120.0, child: Lottie.asset('assets/tips.json')),
                    const Text(
                      'Tips',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ]);
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: frameHeight/5.7,
              child: OpenContainer(
                closedColor: Colors.white12,
                openColor: const Color(0xFF004B23),
                closedElevation: 0.0,
                openElevation: 0.0,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, action) {
                  return const Text('data');
                },
                closedBuilder: (context, action) {
                  return Column(children: [
                    SizedBox(
                        height: 120.0,
                        child: Lottie.asset('assets/alerts.json')),
                    const Text(
                      'Alerts',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ]);
                },
              ),
            ),
          ]),

      ],
      fullyStretchable: true,
      expandedBody: Text('hello'),
    ));
  }

  Container headerBottomBarWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(color: Colors.white ,onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
    );
  }

  Container headerWidget(BuildContext context) => Container(
        child: Center(
          child: Text("dmts",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white70)),
        ),
      );
}
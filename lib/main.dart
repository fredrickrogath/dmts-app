import 'dart:ui';

import 'package:dmts/health_history.dart';
import 'package:dmts/homepage.dart';
import 'package:dmts/kidney_ability.dart';
import 'package:dmts/themes/primary_swatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

final darkNotifier = ValueNotifier<bool>(false);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(primaryColor: MaterialColor(0xFF004B23, color)),
            darkTheme: ThemeData.dark(),
            home: const MyHomePage(
              title: 'Reward Shidende',
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _showAppbar = true; //this is to show app bar
  final ScrollController _scrollBottomBarController =
      ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  bool _animate = true;
  bool _show = true;
  double bottomBarHeight = 50; // set bottom bar height

  setDarkMode(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  getdarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkNotifier.value = prefs.getBool('darkMode') ?? false;
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getdarkMode();
    myScroll();
  }

  @override
  void dispose() {
    _scrollBottomBarController.removeListener(() {});
    darkNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return DefaultTabController(
      animationDuration: const Duration(seconds: 1),
      length: 3,
      child: Scaffold(
        backgroundColor:  Colors.white.withOpacity(0.8),
        appBar: _showAppbar
            ? AppBar(
                toolbarHeight: 80.0,
                // backgroundColor: const Color(0xFF004B23),
                backgroundColor: Colors.white.withOpacity(0.5),
                // centerTitle: true,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/logo2.jpg'),
                  ),
                ),
                // flexibleSpace: FlexibleSpaceBar(
                //     centerTitle: true,
                //     background: Opacity(
                //       opacity: 0.2,
                //       child: Image.asset(
                //         'assets/logo/logo2.jpg',
                //         fit: BoxFit.cover,
                //       ),
                //     )),
                title: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16.0, color: Color(0xFF004B23)),
                ),
                bottom: PreferredSize(
                    child: TabBar(
                        isScrollable: true,
                        labelColor: const Color(0xFF004B23),
                        unselectedLabelColor:
                            const Color(0xFF004B23).withOpacity(0.6),
                        indicatorColor: const Color(0xFF004B23),
                        labelStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            child: Text('Dashboard'),
                          ),
                          Tab(
                            child: Text('Health History'),
                          ),
                          Tab(
                            child: Text('Kidney Ability'),
                          ),
                        ]),
                    preferredSize: const Size.fromHeight(30.0)),
                actions: [
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 16.0),
                  //   child: IconButton(
                  //     // icon: FaIcon(FontAwesomeIcons.mode_night_outlined),
                  //     icon: Icon(
                  //       isDark
                  //           ? Icons.wb_sunny_outlined
                  //           : Icons.mode_night_outlined,
                  //       color: const Color(0xFF004B23),
                  //     ),
                  //     onPressed: () {
                  //       isDark = !isDark;
                  //       darkNotifier.value = isDark;
                  //       setDarkMode(isDark);
                  //       setState(() {});
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          CupertinoIcons.bell,
                          color: Color(0xFF004B23),
                        ),
                        Icon(
                          CupertinoIcons.circle_fill,
                          color: Color(0xFFC1292E),
                          size: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : PreferredSize(
                child: Container(),
                preferredSize: const Size(0.0, 0.0),
              ),
        body: const TabBarView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: [
            HomePage(),
            // HomePage(),
            HealthHistory(),
            KidneyAbility(),
          ],
        ),
        // floatingActionButton: _show
        //     ? SizedBox(
        //         height: 50.0,
        //         child: FloatingActionButton(
        //           onPressed: () {},
        //           child: const Icon(Icons.add),
        //           elevation: 4.0,
        //           backgroundColor: const Color(0xFF24564F),
        //         ),
        //       )
        //     : const SizedBox(height: 0.0),
        // bottomNavigationBar: BottomAppBar(
        //   child: _show
        //       ? Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             Expanded(
        //               child: IconButton(
        //                 icon: const Icon(Icons.home),
        //                 onPressed: () {},
        //               ),
        //             ),
        //             Expanded(
        //               child: IconButton(
        //                 icon: const Icon(Icons.show_chart),
        //                 onPressed: () {},
        //               ),
        //             ),
        //             const Expanded(child: Text('')),
        //             Expanded(
        //               child: IconButton(
        //                 icon: const Icon(Icons.tab),
        //                 onPressed: () {},
        //               ),
        //             ),
        //             Expanded(
        //               child: IconButton(
        //                 icon: const Icon(Icons.settings),
        //                 onPressed: () {},
        //               ),
        //             ),
        //           ],
        //         )
        //       : const SizedBox(height: 0.0),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // Widget allTab() => Stack(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 58.0),
  //           child: ListView.builder(
  //               controller: _scrollBottomBarController,
  //               padding: const EdgeInsets.all(0.0),
  //               physics: const AlwaysScrollableScrollPhysics(
  //                   parent: BouncingScrollPhysics()),
  //               shrinkWrap: true,
  //               cacheExtent: 50.0,
  //               itemCount: 200,
  //               itemBuilder: (context, index) {
  //                 return const HomePage();
  //               }),
  //         ),
  //         Card(
  //           elevation: 0.0,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           child: Row(
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width / 1.4,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                     // color: Colors.white,
  //                     borderRadius: BorderRadius.circular(5)),
  //                 child: Center(
  //                   child: TextField(
  //                     decoration: InputDecoration(
  //                         prefixIcon: const Icon(Icons.search),
  //                         suffixIcon: IconButton(
  //                           icon: const Icon(Icons.clear, color: Colors.grey),
  //                           onPressed: () {
  //                             /* Clear the search field */
  //                           },
  //                         ),
  //                         hintText: 'Search...',
  //                         border: InputBorder.none),
  //                   ),
  //                 ),
  //               ),
  //               IconButton(
  //                 icon: const Icon(CupertinoIcons.add),
  //                 color: Colors.grey,
  //                 onPressed: () {},
  //               ),
  //               IconButton(
  //                 icon: const Icon(CupertinoIcons.barcode_viewfinder),
  //                 color: Colors.grey,
  //                 onPressed: () {

  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );

  // Widget productsTab() => Stack(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 58.0),
  //           child: ListView.builder(
  //               controller: _scrollBottomBarController,
  //               padding: const EdgeInsets.all(0.0),
  //               physics: const AlwaysScrollableScrollPhysics(
  //                   parent: BouncingScrollPhysics()),
  //               shrinkWrap: true,
  //               cacheExtent: 50.0,
  //               itemCount: 200,
  //               itemBuilder: (context, index) {
  //                 return const HomePage();
  //               }),
  //         ),
  //         Card(
  //           elevation: 0.0,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           child: Row(
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width / 1.4,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                     // color: Colors.white,
  //                     borderRadius: BorderRadius.circular(5)),
  //                 child: Center(
  //                   child: TextField(
  //                     decoration: InputDecoration(
  //                         prefixIcon: const Icon(Icons.search),
  //                         suffixIcon: IconButton(
  //                           icon: const Icon(Icons.clear, color: Colors.grey),
  //                           onPressed: () {
  //                             /* Clear the search field */
  //                           },
  //                         ),
  //                         hintText: 'Search...',
  //                         border: InputBorder.none),
  //                   ),
  //                 ),
  //               ),
  //               IconButton(
  //                 icon: const Icon(CupertinoIcons.add),
  //                 color: Colors.grey,
  //                 onPressed: () {},
  //               ),
  //               IconButton(
  //                 icon: const Icon(CupertinoIcons.barcode_viewfinder),
  //                 color: Colors.grey,
  //                 onPressed: () {

  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );

  // Widget servicesTab() => Stack(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 58.0),
  //           child: ListView.builder(
  //               controller: _scrollBottomBarController,
  //               padding: const EdgeInsets.all(0.0),
  //               physics: const AlwaysScrollableScrollPhysics(
  //                   parent: BouncingScrollPhysics()),
  //               shrinkWrap: true,
  //               cacheExtent: 50.0,
  //               itemCount: 200,
  //               itemBuilder: (context, index) {
  //                 return const HomePage();
  //               }),
  //         ),
  //         Card(
  //           elevation: 0.0,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           child: Row(
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width / 1.4,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                     // color: Colors.white,
  //                     borderRadius: BorderRadius.circular(5)),
  //                 child: Center(
  //                   child: TextField(
  //                     decoration: InputDecoration(
  //                         prefixIcon: const Icon(Icons.search),
  //                         suffixIcon: IconButton(
  //                           icon: const Icon(Icons.clear, color: Colors.grey),
  //                           onPressed: () {
  //                             /* Clear the search field */
  //                           },
  //                         ),
  //                         hintText: 'Search...',
  //                         border: InputBorder.none),
  //                   ),
  //                 ),
  //               ),
  //               IconButton(
  //                 icon: const Icon(CupertinoIcons.add),
  //                 color: Colors.grey,
  //                 onPressed: () {},
  //               ),
  //               IconButton(
  //                 icon: const Icon(CupertinoIcons.barcode_viewfinder),
  //                 color: Colors.grey,
  //                 onPressed: () {

  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );

  // Widget insightsTab() => Stack(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 280.0),
  //           child: ListView.builder(
  //               controller: _scrollBottomBarController,
  //               padding: const EdgeInsets.all(0.0),
  //               physics: const AlwaysScrollableScrollPhysics(
  //                   parent: BouncingScrollPhysics()),
  //               shrinkWrap: true,
  //               cacheExtent: 50.0,
  //               itemCount: 200,
  //               itemBuilder: (context, index) {
  //                 return const HomePage();
  //               }),
  //         ),
  //         Column(children: [
  //           Card(
  //             elevation: 0.0,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10.0),
  //             ),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   width: MediaQuery.of(context).size.width / 1.4,
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       // color: Colors.white,
  //                       borderRadius: BorderRadius.circular(5)),
  //                   child: Center(
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                           prefixIcon: const Icon(Icons.search),
  //                           suffixIcon: IconButton(
  //                             icon: const Icon(Icons.clear, color: Colors.grey),
  //                             onPressed: () {
  //                               /* Clear the search field */
  //                             },
  //                           ),
  //                           hintText: 'Search...',
  //                           border: InputBorder.none),
  //                     ),
  //                   ),
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(CupertinoIcons.add),
  //                   color: Colors.grey,
  //                   onPressed: () {},
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(CupertinoIcons.barcode_viewfinder),
  //                   color: Colors.grey,
  //                   onPressed: () {

  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //               height: 240.0,
  //               child: Column(
  //                 children: [
  //                   SizedBox(
  //                     height: 40.0,
  //                     child: Card(
  //                       elevation: 0.0,
  //                       child: Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: const [
  //                             Text('Stock Value'),
  //                             Text('Tsh 8,700,000')
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Card(
  //                             child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 60.0, vertical: 10.0),
  //                           child: Column(children: const [
  //                             Text('2,751'),
  //                             SizedBox(height: 10.0),
  //                             Text('In Stock'),
  //                           ]),
  //                         )),
  //                         Card(
  //                             child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 30.0, vertical: 10.0),
  //                           child: Column(children: const [
  //                             Text('6'),
  //                             SizedBox(height: 10.0),
  //                             Text('Inventory Turnover'),
  //                           ]),
  //                         )),
  //                       ]),
  //                   Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Card(
  //                             child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 60.0, vertical: 10.0),
  //                           child: Column(children: const [
  //                             Text('832'),
  //                             SizedBox(height: 10.0),
  //                             Text('Stock In'),
  //                           ]),
  //                         )),
  //                         Card(
  //                             child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 60.0, vertical: 10.0),
  //                           child: Column(children: const [
  //                             Text('751'),
  //                             SizedBox(height: 10.0),
  //                             Text('Stock Out'),
  //                           ]),
  //                         )),
  //                       ]),
  //                   SizedBox(
  //                     height: 40.0,
  //                     child: Card(
  //                       elevation: 0.0,
  //                       child: Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: const [
  //                             Text('Top Selling Items'),
  //                             Icon(CupertinoIcons.text_alignright,
  //                                 color: Colors.grey)
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )),
  //         ]),
  //       ],
  //     );

  // Widget unitsTab() => Stack(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 98.0),
  //           child: ListView.builder(
  //               controller: _scrollBottomBarController,
  //               padding: const EdgeInsets.all(0.0),
  //               physics: const AlwaysScrollableScrollPhysics(
  //                   parent: BouncingScrollPhysics()),
  //               shrinkWrap: true,
  //               cacheExtent: 50.0,
  //               itemCount: 200,
  //               itemBuilder: (context, index) {
  //                 return SizedBox(
  //                   height: 40.0,
  //                   child: Card(
  //                     elevation: 0.0,
  //                     child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: const [
  //                           Text('CocaCola'),
  //                           Text('7 Boxes',
  //                               style: TextStyle(
  //                                 fontStyle: FontStyle.italic,
  //                               )),
  //                           Text('58 Cans',
  //                               style: TextStyle(
  //                                 fontStyle: FontStyle.italic,
  //                               )),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               }),
  //         ),
  //         Column(children: [
  //           Card(
  //             elevation: 0.0,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10.0),
  //             ),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   width: MediaQuery.of(context).size.width / 1.4,
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       // color: Colors.white,
  //                       borderRadius: BorderRadius.circular(5)),
  //                   child: Center(
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                           prefixIcon: const Icon(Icons.search),
  //                           suffixIcon: IconButton(
  //                             icon: const Icon(Icons.clear, color: Colors.grey),
  //                             onPressed: () {
  //                               /* Clear the search field */
  //                             },
  //                           ),
  //                           hintText: 'Search...',
  //                           border: InputBorder.none),
  //                     ),
  //                   ),
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(CupertinoIcons.add),
  //                   color: Colors.grey,
  //                   onPressed: () {},
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(CupertinoIcons.barcode_viewfinder),
  //                   color: Colors.grey,
  //                   onPressed: () {

  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40.0,
  //             child: Card(
  //               elevation: 0.0,
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: const [
  //                     Text('Item'),
  //                     Text('Primary Unit'),
  //                     Text('Secondary Unit')
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ]),
  //       ],
  //     );
}

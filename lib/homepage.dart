// import 'package:animations/animations.dart';
import 'package:dmts/pages/alerts.dart';
import 'package:dmts/pages/details.dart';
import 'package:dmts/pages/report.dart';
import 'package:dmts/pages/suggestions.dart';
import 'package:dmts/pages/tips.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:carousel_slider/carousel_slider.dart';
// import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  //   begin: Offset.zero,
  //   end: const Offset(1.5, 0.0),
  // ).animate(CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.elasticIn,
  // ));

  bool animated = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              'DMTS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF004B23),
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: GridView.count(
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Expanded(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(2.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.decelerate,
                )),
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          animated = true;
                        });
                      },
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset('assets/profile.json'))),
                  const Text(
                    'My profile',
                    style: TextStyle(fontSize: 12),
                  )
                ]),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(3.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.decelerate,
              )),
              child: Expanded(
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Details()),
                        );
                      },
                      child: SizedBox(
                          height: 100.0,
                          width: 100.0,
                          child: Lottie.asset('assets/details.json'))),
                  const Text(
                    'Daily Details',
                    style: TextStyle(fontSize: 12),
                  )
                ]),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(4.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.decelerate,
              )),
              child: Expanded(
                  child: Column(children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Report()),
                      );
                    },
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.asset('assets/report.json'))),
                const Text(
                  'Report',
                  style: TextStyle(fontSize: 12),
                ),
              ])),
            ),
            Expanded(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-2.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.decelerate,
                )),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Suggestions()),
                          );
                        },
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child:
                                Lottie.asset('assets/recommendations.json'))),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Suggestions',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-3.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.decelerate,
                )),
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Tips()),
                        );
                      },
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset('assets/tips.json'))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Tips',
                        style: TextStyle(fontSize: 12),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                            height: 20,
                            width: 35,
                            color: const Color(0xFF008000),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "8",
                                  style: TextStyle(fontSize: 12),
                                ))),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-4.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.decelerate,
                )),
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Tips()),
                        );
                      },
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset('assets/alerts.json'))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Alerts',
                        style: TextStyle(fontSize: 12),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                            height: 20,
                            width: 35,
                            color: const Color(0xFF008000),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "8",
                                  style: TextStyle(fontSize: 12),
                                ))),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            // Lottie.asset('assets/profile.json'),
            // Lottie.asset('assets/profile.json'),
            // Lottie.asset('assets/profile.json'),
            // Lottie.asset('assets/profile.json'),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              'Health Articles',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF004B23),
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView(
          children: [
            CarouselSlider(
              items: [
                //1st Image of Slider
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Secret in diets',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Written by',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Reward Elifuraha',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF004B23),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                //2nd Image of Slider
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Secret in diets',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Written by',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Reward Elifuraha',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF004B23),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                //3rd Image of Slider
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Secret in diets',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Written by',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Reward Elifuraha',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF004B23),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                //4th Image of Slider
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Secret in diets',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Written by',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Reward Elifuraha',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF004B23),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                //5th Image of Slider
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Secret in diets',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Written by',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Reward Elifuraha',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF004B23),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

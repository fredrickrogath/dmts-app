import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class HealthHistory extends StatefulWidget {
  const HealthHistory({Key? key}) : super(key: key);

  @override
  State<HealthHistory> createState() => _HealthHistoryState();
}

class _HealthHistoryState extends State<HealthHistory> {
  bool _show = false;
  int id = 0;
  String tip = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            // controller: _scrollBottomBarController,
            padding: const EdgeInsets.all(0.0),
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            shrinkWrap: true,
            cacheExtent: 50.0,
            itemCount: 7,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // _show = true;
                  // tip = 'mboje';
                  // id = index;
                  // setState(() {});
                },
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
                            Row(children: const [Text('Period: ', style: TextStyle(fontWeight: FontWeight.w500)), Text('Morning')],),
                            Row(children: const [Text('Meal: ', style: TextStyle(fontWeight: FontWeight.w500)), Text('Cereals')],),
                            Row(children: const [Text('Exercise: ', style: TextStyle(fontWeight: FontWeight.w500)), Text('Jogging')],),
                      //  Text('Period: Morning'), Text('Meals: Cereals'), Text('Exercise: jogging'),
                    ],),
                      ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: const [
                      Text('Pressure: 100 mmHg'), Text('Glucose: 12'), 
                    ],),
                   const  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Date 2022-05-02'),
                    )
                    ],)
                  ),
                ),
              );
            }),
        bottomSheet: _showBottomSheet(id, tip));
  }

  Widget _showBottomSheet(id, tip) {
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        OpenContainer(
                          // closedColor: Colors.white,
                          // openColor: const Color(0xFF337A6F),
                          closedElevation: 0.0,
                          openElevation: 0.0,
                          // closedShape: const RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration: const Duration(milliseconds: 100),
                          openBuilder: (context, action) {
                            return PhotoView(
                                imageProvider:
                                    const AssetImage("assets/logo2.jpg"));

                            // ViewImage(image: 'assets/logo/logo2.jpg');
                          },
                          closedBuilder: (context, action) {
                            return AspectRatio(
                              aspectRatio: 4 / 3,
                              child: ClipRRect(
                                // borderRadius:
                                //     BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        0), // Image radius
                                    child: const Image(
                                      image: AssetImage('assets/logo2.jpg'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF337A6F),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'All 5arbs affect blood glucose levels so it’s important to know which foods contain carbohydrates. Choose the healthier foods that contain carbs and be aware of your portion sizes.',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Here are some healthy sources of carbohydrate:',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '1: whole grains like brown rice, buckwheat and whole oats',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '2: fruit',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '3: vegetables',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '4: pulses such as chickpeas, beans and lentils',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '5: dairy like unsweetened yoghurt and milk.',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Here are some healthy sources of carbohydrate:',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    SizedBox(
                      width: 370,
                      child: FloatingActionButton.extended(
                          elevation: 0.0,
                          backgroundColor: const Color(0XFFef233c),
                          onPressed: () {
                            _show = false;
                            setState(() {});
                          },
                          label: const Text('Close')),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    } else {
      return const Text('');
    }
  }
}

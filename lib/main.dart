import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dmts/themes/primary_swatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dmts/homepage.dart';

// import 'login_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((val) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xFF004B23),
      title: 'D M T S',
      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.white),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.orange,
          ),
          button: const TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: const TextStyle(fontFamily: 'Quicksand'),
          headline2: const TextStyle(fontFamily: 'Quicksand'),
          headline4: const TextStyle(fontFamily: 'Quicksand'),
          headline5: const TextStyle(fontFamily: 'NotoSans'),
          headline6: const TextStyle(fontFamily: 'NotoSans'),
          subtitle1: const TextStyle(fontFamily: 'NotoSans'),
          bodyText1: const TextStyle(fontFamily: 'NotoSans'),
          bodyText2: const TextStyle(fontFamily: 'NotoSans'),
          subtitle2: const TextStyle(fontFamily: 'NotoSans'),
          overline: const TextStyle(fontFamily: 'NotoSans'),
        ),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: MaterialColor(0xFF004B23, color))
            .copyWith(secondary: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          // centered: false,
          splashIconSize: double.maxFinite,
          duration: 000,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextLiquidFill(
                  text: 'DMTS',
                  waveColor: Colors.white,
                  boxBackgroundColor: const Color(0xFF004B23),
                  textStyle: const TextStyle(fontSize: 45.0, letterSpacing: 10),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Image.asset(
                "assets/logo.png",
                // fit: BoxFit.cover,
                height: 50.0,
                width: 50.0,
                // alignment: Alignment.center,
              ),
            ],
          ),
          nextScreen: NavigationBar(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color(0xFF004B23)),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  // final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  // final PersistentTabController _controller =
  //     PersistentTabController(initialIndex: 0);

  double heightFrame = 0.0;
  double widthFrame = 0.0;
  //List<String> _titles = ["Home", "Profile", "Shop"];
  List<Widget> _items = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    heightFrame = MediaQuery.of(context).size.height;

    widthFrame = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _items) //_items.elementAt(_index),
          ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav()
  {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
        ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF004B23),
      unselectedItemColor: Colors.grey,
      selectedFontSize:12.0,
      unselectedFontSize: 14.0,
      onTap: _onTap,
    );
  }
 
  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {
 
    });
  }
}

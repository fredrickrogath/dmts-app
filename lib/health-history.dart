import 'package:flutter/material.dart';

class HealthHistory extends StatefulWidget {

   HealthHistory({ Key? key }) : super(key: key);

  @override
  State<HealthHistory> createState() => _HealthHistoryState();
}

class _HealthHistoryState extends State<HealthHistory> {
bool isReadmore= false;

// getReadMore
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
        children: [
          const Text('Read More Example',style: TextStyle(),),
          buildText("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
          ElevatedButton(onPressed: (){
            setState(() {
              isReadmore = !isReadmore;
            });
          }, child: Text((isReadmore?'Read Less' : 'Read More')))
        ],
      ));
  }

    Widget buildText(String text){
    
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style: const TextStyle(),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible: TextOverflow.ellipsis,
    );
  }
}
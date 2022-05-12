import 'package:flutter/material.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({ Key? key }) : super(key: key);

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions>{
 final  List<Element> _elements = <Element>[
  Element(DateTime(2020, 6, 24, 18), 'Fika hospitali baada ya wiki 1', Icons.chat_bubble_outline),
  Element(DateTime(2020, 6, 24, 9), 'Fanya mazoezi wa wingi', Icons.chat_bubble_outline),
  Element(DateTime(2020, 6, 25, 8), 'Kunywa maji mengi', Icons.chat_bubble_outline),
  Element(DateTime(2020, 6, 25, 16), 'Punguza mawazo', Icons.chat_bubble_outline),
  Element(DateTime(2020, 6, 25, 20), 'Fata dozi', Icons.chat_bubble_outline),
  Element(DateTime(2020, 6, 26, 12), 'Kula matunda na mbogamboga kwaa wingi', Icons.chat_bubble_outline),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
          backgroundColor: const Color(0xFF004B23),
        ),
      body: StickyGroupedListView<Element, DateTime>(
          elements: _elements,
          order: StickyGroupedListOrder.ASC,
          groupBy: (Element element) =>
              DateTime(element.date.year, element.date.month, element.date.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (Element element1, Element element2) =>
              element1.date.compareTo(element2.date),
          floatingHeader: true,
          groupSeparatorBuilder: (Element element) => SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  border: Border.all(
                    color: Colors.green[300]!,
                  ),
                  borderRadius:const  BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${element.date.day}. ${element.date.month}, ${element.date.year}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (_, Element element) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: ListTile(
                contentPadding:
                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Icon(element.icon),
                title: Text(element.name),
                trailing: Text('${element.date.hour}:00'),
              ),
            );
          },
        ),
      
    );
  }
}

class Element {
  DateTime date;
  String name;
  IconData icon;

  Element(this.date, this.name, this.icon);
}
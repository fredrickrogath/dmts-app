import 'package:dmts/providers/history.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class HealthHistory extends StatelessWidget {
  const HealthHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GroupedListView<dynamic, String>(
        elements: context.watch<History>().getHistory,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Icon(Icons.account_circle),
                title: Text(element['name']),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      ),
    );
  }
}

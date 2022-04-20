import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BloodGlucose extends StatefulWidget {
  BloodGlucose({Key? key}) : super(key: key);

  @override
  State<BloodGlucose> createState() => _BloodGlucoseState();
}

class _BloodGlucoseState extends State<BloodGlucose> {
  bool hideForm = false;
  String dropdownvalue = 'Before Breakfast';

  // List of items in our dropdown menu
  var items = [
    'Before Breakfast',
    'Breakfast',
    'After Breakfast',
    'Launch',
    'After Lauch',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004B23),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: hideForm
          ? Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Total records 0'),
                )
              ]),
              Lottie.asset('assets/glucometer.json')
            ])
          : SingleChildScrollView(
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,children: [Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: OutlinedButton(
  // style: outlineButtonStyle,
  onPressed: () { },
  child: Text('Submit', style:TextStyle(color:const Color(0xFF004B23))),
),
                )],),
                // SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // const SizedBox(height: 5),
                        const TextField(
                          decoration: InputDecoration(
                            suffix: Text('mmol/L'),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF0096C7), width: 2.0),
                            ),
                            border: UnderlineInputBorder(),
                            hintText: 'Sugar Concentration',
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.0,
                          height: MediaQuery.of(context).size.height / 17,
                          child: DropdownButton(
                            style: TextStyle(color: Colors.grey[600], fontSize: 16),
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.height / 40),
                        // TextField(
                        //   textAlign: TextAlign.right,
                        //   style: const TextStyle(fontSize: 16.0),
                        //   // controller:
                        //   // dateStart, //editing controller of this TextField
                        //   decoration: const InputDecoration(
                        //       suffixIcon: Icon(Icons.calendar_today),
                        //       labelText: "Event Date" //label text of field
                        //       ),
                        //   readOnly:
                        //       true, //set it true, so that user will not able to edit text
                        //   onTap: () async {
                        //     DateTime? pickedDate = await showDatePicker(
                        //         context: context,
                        //         initialDate: DateTime.now(),
                        //         firstDate: DateTime(
                        //             2000), //DateTime.now() - not to allow to choose before today.
                        //         lastDate: DateTime(2101));

                        //     if (pickedDate != null) {
                        //       // print(
                        //       //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        //       // String formattedDate =
                        //       //     DateFormat('yyyy-MM-dd').format(pickedDate);
                        //       // print(
                        //       //     formattedDate); //formatted date output using intl package =>  2021-03-16
                        //       //you can implement different kind of Date Format here according to your requirement

                        //       // setState(() {
                        //       //   dateStart.text =
                        //       //       formattedDate; //set output date to TextField value.
                        //       // });
                        //     } else {
                        //       print("Date is not selected");
                        //     }
                        //   },
                        // ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        TextFormField(
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            hintText: "Note",
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                          minLines:
                              6, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height / 50),
              ]),
            ),
    );
  }
}

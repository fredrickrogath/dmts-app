import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  bool hideForm = true;
  String dropdownvalue = 'Right Arm';
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  // List of items in our dropdown menu
  var items = [
    'Right Arm',
    'Left Arm',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004B23),
        actions: [
          IconButton(
              onPressed: () {
                hideForm = !hideForm;
                setState(() {});
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: hideForm
          ? Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Total records 0'),
                )
              ]),
              Lottie.asset('assets/boodpressure.json')
            ])
          : SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: OutlinedButton(
                        // style: outlineButtonStyle,
                        onPressed: () {},
                        child: const Text('Submit',
                            style: TextStyle(color: Color(0xFF004B23))),
                      ),
                    )
                  ],
                ),
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
                            suffix: Text('mm Hg'),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF004B23), width: 2.0),
                            ),
                            border: UnderlineInputBorder(),
                            hintText: 'Blood pressure',
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        const TextField(
                          decoration: InputDecoration(
                            suffix: Text('mm Hg'),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF004B23), width: 2.0),
                            ),
                            border: UnderlineInputBorder(),
                            hintText: 'Pulse Rate',
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.0,
                          height: MediaQuery.of(context).size.height / 17,
                          child: DropdownButton(
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16),
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

                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        TextFormField(
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF004B23), width: 2.0),
                            ),
                            border: UnderlineInputBorder(),
                            hintText: "Note",
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

                // const Center(
                //   child: Text('Experiencing any of the following ?',
                //       style: TextStyle(fontSize: 16)),
                // ),

                // GFCard(
                //   content: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: <Widget>[
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             GFCheckbox(
                //               size: GFSize.SMALL,
                //               activeBgColor: GFColors.SUCCESS,
                //               type: GFCheckboxType.circle,
                //               onChanged: (value) {
                //                 setState(() {
                //                   isChecked1 = value;
                //                 });
                //               },
                //               value: isChecked1,
                //               inactiveIcon: null,
                //             ),
                //             const Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 20.0),
                //               child: Text('Wounds that takes time to heal.',
                //                   style: TextStyle(fontSize: 15)),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             GFCheckbox(
                //               size: GFSize.SMALL,
                //               activeBgColor: GFColors.SUCCESS,
                //               type: GFCheckboxType.circle,
                //               onChanged: (value) {
                //                 setState(() {
                //                   isChecked2 = value;
                //                 });
                //               },
                //               value: isChecked2,
                //               inactiveIcon: null,
                //             ),
                //             const Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 20.0),
                //               child: Text('Blur vision.',
                //                   style: TextStyle(fontSize: 15)),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             GFCheckbox(
                //               size: GFSize.SMALL,
                //               activeBgColor: GFColors.SUCCESS,
                //               type: GFCheckboxType.circle,
                //               onChanged: (value) {
                //                 setState(() {
                //                   isChecked3 = value;
                //                 });
                //               },
                //               value: isChecked3,
                //               inactiveIcon: null,
                //             ),
                //             const Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 20.0),
                //               child: Text('Virginal itching.',
                //                   style: TextStyle(fontSize: 15)),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             GFCheckbox(
                //               size: GFSize.SMALL,
                //               activeBgColor: GFColors.SUCCESS,
                //               type: GFCheckboxType.circle,
                //               onChanged: (value) {
                //                 setState(() {
                //                   isChecked4 = value;
                //                 });
                //               },
                //               value: isChecked4,
                //               inactiveIcon: null,
                //             ),
                //             const Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 20.0),
                //               child: Text('Feeling numb.',
                //                   style: TextStyle(fontSize: 15)),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ]),
            ),
    );
  }
}

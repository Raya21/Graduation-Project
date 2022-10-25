import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Section3 extends StatefulWidget {
  const Section3({super.key});

  @override
  State<Section3> createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  var selectedItem = null;
  var x = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Number of family members including parents :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Number of university students in the family :    ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Number of family members with chronic diseases :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Family income in shekels per month :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: [
                    "------------",
                    "0 - 2000",
                    "2001 - 3000",
                    "3001 - 4000",
                    "4001 - 5000",
                    "5001 - 10000",
                    "Above 10000"
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        //labelText:
                        //"Does the family have assistance such as a business card or zakat",
                        // hintText: "Yes or No",
                        ),
                  ),
                  //onChanged: print,
                  selectedItem: "------------",
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Does the family have assistance such as a business card or zakat?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: [
                    "Yes",
                    "No",
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        //labelText:
                        //"Does the family have assistance such as a business card or zakat",
                        // hintText: "Yes or No",
                        ),
                  ),
                  //onChanged: print,
                  selectedItem: "No",
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "If the family has an affairs card, please enter the card number :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Student family housing",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 400,
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: [
                    "Property",
                    "Rent",
                    "Live with another family without paying rent"
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        //labelText:
                        //"Student family housing",
                        //hintText: "Yes or No",
                        ),
                  ),
                  //onChanged: print,
                  selectedItem: "Property",
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The monthly rent for the family housing in shekels, if any",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: [
                    "-------------------",
                    "0 _ 1000",
                    "1000 _ 2000",
                    "2001 _ 3000",
                    "Above 3000"
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        //labelText:
                        //"Student family housing",
                        //hintText: "Yes or No",
                        ),
                  ),
                  //onChanged: print,
                  selectedItem: "-------------------",
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Family residence",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: ["City", "Village", "Camp", "Abroad"],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          //labelText:
                          //"Student family housing",
                          //hintText: "Yes or No",
                          ),
                    ),
                    //onChanged: print,
                    selectedItem: "City"),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            "The number of vehicles the family owns :",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Private         ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Public           ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Commercial ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The monthly student housing fee in shekels, if any :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Do you smoke ?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: ["Yes", "No"],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          //labelText:
                          //"Student family housing",
                          //hintText: "Yes or No",
                          ),
                    ),
                    //onChanged: print,
                    selectedItem: "No"),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Text(
            "Undergraduate fraternity data :",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Table(
            border: TableBorder.all(),
            children: [
              buildRow([
                'Student Name',
                'Registration number',
                'College Name',
                'University Name',
              ]),
              buildRow([' ', ' ', ' ', ' '], isHeader: true),
              buildRow([' ', ' ', ' ', ' ']),
              buildRow([' ', ' ', ' ', ' ']),
              buildRow([' ', ' ', ' ', ' ']),
              buildRow([' ', ' ', ' ', ' ']),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: (() {}),
            child: Text(
              "Save data",
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
          children: cells.map((cell) {
        final Style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        );
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(child: Text(cell)),
        );
      }).toList());
}

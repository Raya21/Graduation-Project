import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Section2 extends StatefulWidget {
  const Section2({super.key});

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  var selectedItem = null;
  var x = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The funder of university costs",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: [
                    "Father",
                    "Mother",
                    "Husband/Wife",
                    "Other",
                    "Me personally",
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Relative Relation",
                      //hintText: "country in menu mode",
                    ),
                  ),
                  //onChanged: print,
                  selectedItem: selectedItem,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "If the relationship is other, please fill in the following data:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quatrain Name ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 230,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ID Number         ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 230,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "The Ministry of Education and Higher Education",
              "Ministry of Health",
              "The rest of the ministries",
              "Security Services",
              "Not a government job",
              "Abroad"
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Place",
                //hintText: "country in menu mode",
              ),
            ),
            //onChanged: print,
            selectedItem: selectedItem,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
            ),
            items: [
              "----",
              "General Manager and above",
              "Administrator",
              "Head of the Department",
              "Employee",
              "Teacher",
              "Soldier",
              "Retired employee",
              "Merchant",
              "Contractor",
              "shopkeeper",
              "Salesman in a shop",
              "Peddler",
              "Free business",
              "Poultry and livestock farming",
              "Hairdressing",
              "Guard",
              "Handicraft(marble, glass, crafting ..etc)",
              "Maintenance (cars, electrical ..etc)",
              "Driver",
              "Plumber",
              "Carpenter",
              "Blacksmith",
              "upholstery",
              "Worker (construction, restaurants, factories, etc.)",
              "Ironing clothes",
              "Sewing",
              "Farmer",
              "Photographer",
              "Graphic designer",
              "Observer",
              "Technical",
              "Land survey",
              "Tour guide",
              "Sales Representative",
              "Sales Supervisor",
              "Nursery or Kindergarten",
              "Athlete",
              "Librarian",
              "Secretary",
              "Writer",
              "Translator",
              "Tax collection",
              "Accountant",
              "Journalist",
              "Computer programmer",
              "Lawyer",
              "Legal advisor",
              "Engineer",
              "Pharmacist",
              "Nurse",
              "Optics",
              "Physical therapy",
              "Doctor"
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Job",
                //hintText: "country in menu mode",
              ),
            ),
            //onChanged: print,Teacher
            selectedItem: selectedItem,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Note                  ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 230,
                child: TextFormField(
                  maxLines: 6,
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
      ],
    );
  }
}

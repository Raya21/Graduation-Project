import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

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
                "The funder of university costs".tr,
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
                    "Father".tr,
                    "Mother".tr,
                    "Husband/Wife".tr,
                    "Other".tr,
                    "Me personally".tr,
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Relative Relation".tr,
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
                "relationship".tr,
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
                      "Quatrain Name ".tr,
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
                      "ID Number         ".tr,
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
          margin: EdgeInsets.only(left: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "The Ministry of Education and Higher Education".tr,
              "Ministry of Health".tr,
              "The rest of the ministries".tr,
              "Security Services".tr,
              "Not a government job".tr,
              "Abroad".tr
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Place".tr,
                //hintText: "country in menu mode",
              ),
            ),
            //onChanged: print,
            selectedItem: selectedItem,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
            ),
            items: [
              "----",
              "General Manager and above".tr,
              "Administrator".tr,
              "Head of the Department".tr,
              "Employee".tr,
              "Teacher".tr,
              "Soldier".tr,
              "Retired employee".tr,
              "Merchant".tr,
              "Contractor".tr,
              "shopkeeper".tr,
              "Salesman in a shop".tr,
              "Peddler".tr,
              "Free business".tr,
              "Poultry and livestock farming".tr,
              "Hairdressing".tr,
              "Guard".tr,
              "Handicraft(marble, glass, crafting ..etc)".tr,
              "Maintenance (cars, electrical ..etc)".tr,
              "Driver".tr,
              "Plumber".tr,
              "Carpenter".tr,
              "Blacksmith".tr,
              "upholstery".tr,
              "Worker (construction, restaurants, factories, etc.)".tr,
              "Ironing clothes".tr,
              "Sewing".tr,
              "Farmer".tr,
              "Photographer".tr,
              "Graphic designer".tr,
              "Observer".tr,
              "Technical".tr,
              "Land survey".tr,
              "Tour guide".tr,
              "Sales Representative".tr,
              "Sales Supervisor".tr,
              "Nursery or Kindergarten".tr,
              "Athlete".tr,
              "Librarian".tr,
              "Secretary".tr,
              "Writer".tr,
              "Translator".tr,
              "Tax collection".tr,
              "Accountant".tr,
              "Journalist".tr,
              "Computer programmer".tr,
              "Lawyer".tr,
              "Legal advisor".tr,
              "Engineer".tr,
              "Pharmacist".tr,
              "Nurse".tr,
              "Optics".tr,
              "Physical therapy".tr,
              "Doctor".tr
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Job".tr,
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
                "Note:                 ".tr,
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

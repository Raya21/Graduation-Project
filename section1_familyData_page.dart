import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Section1 extends StatefulWidget {
  const Section1({super.key});

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  var selectedItem = null;
  var x = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Student Name",
                    labelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Student Number",
                    labelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "ID Number",
                    labelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.pink,
                thickness: 1,
              )
            ]),
      ),
      Container(
        margin: EdgeInsets.only(left: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: ["Single", "Married"],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Social Situation",
              //hintText: "country in menu mode",
            ),
          ),
          //onChanged: print,
          selectedItem: selectedItem,
        ),
      ),
      /********************************************************************************  Father information *******************************************************************/
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Father",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
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
              "Quatrain Name ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 230,
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
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ID Number         ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 230,
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
        margin: EdgeInsets.only(left: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "Works",
            "Does not work",
            "Prisoner",
            "Retired",
            "Aged/Sickly",
            "Deceased"
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Career Status",
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
        //   color: Color.fromARGB(255, 172, 117, 182),
        margin: EdgeInsets.only(left: 20, top: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            //disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "----",
            "Owns a place/work tools",
            "Tenant of place/tools for work",
            "Employee",
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Work Nature",
              //hintText: "country in menu mode",
            ),
          ),
          //onChanged: print,
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
              "Job description  ",
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
      SizedBox(
        height: 20,
      ),
      /******************************************************************************** End of father information ****************************************************************/
      Divider(
        color: Colors.pink,
        thickness: 1,
      ),

      /********************************************************************************  Mother information *******************************************************************/
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mother",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
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
              "Quatrain Name ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 230,
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
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ID Number         ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 230,
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
        margin: EdgeInsets.only(left: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "Works",
            "Does not work",
            "Prisoner",
            "Retired",
            "Aged/Sickly",
            "Deceased"
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Career Status",
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
        //   color: Color.fromARGB(255, 172, 117, 182),
        margin: EdgeInsets.only(left: 20, top: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            //disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "----",
            "Owns a place/work tools",
            "Tenant of place/tools for work",
            "Employee",
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Work Nature",
              //hintText: "country in menu mode",
            ),
          ),
          //onChanged: print,
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
              "Job description  ",
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
      SizedBox(
        height: 20,
      ),
      /******************************************************************************** End of mother information ***************************************************************/
      Divider(
        color: Colors.pink,
        thickness: 1,
      ),
      /********************************************************************************  Husband/Wife information *************************************************************/
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Husband/Wife",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
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
              "Quatrain Name ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 230,
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
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ID Number         ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 230,
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
        margin: EdgeInsets.only(left: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "Works",
            "Does not work",
            "Prisoner",
            "Retired",
            "Aged/Sickly",
            "Deceased"
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Career Status",
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
        //   color: Color.fromARGB(255, 172, 117, 182),
        margin: EdgeInsets.only(left: 20, top: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            //disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "----",
            "Owns a place/work tools",
            "Tenant of place/tools for work",
            "Employee",
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Work Nature",
              //hintText: "country in menu mode",
            ),
          ),
          //onChanged: print,
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
              "Job description  ",
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
      SizedBox(
        height: 20,
      ),
      /******************************************************************************** End of husband/wife information *********************************************************/
      Divider(
        color: Colors.pink,
        thickness: 1,
      ),
      Container(
        //color: Color.fromARGB(255, 172, 117, 182),
        margin: EdgeInsets.only(left: 20, top: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            //disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: [
            "----",
            "Married",
            "One of them is dead",
            "Employee",
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Parents' social status",
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
      Divider(
        color: Colors.pink,
        thickness: 1,
      ),
    ]); //Column
  }
}

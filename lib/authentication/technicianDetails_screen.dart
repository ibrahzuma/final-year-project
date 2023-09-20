import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../splashScreen/splash_screen.dart';

// ignore: use_key_in_widget_constructors
class CarInfoScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carTypesList = ["mechanics", "plumber", "electrician"];
  String? selectedCarType;

  saveCarInfo() {
    Map driverCarInfoMap = {
      "car_color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child("drivers");
    driversRef
        .child(currentFirebaseUser!.uid)
        .child("car_details")
        .set(driverCarInfoMap);

    Fluttertoast.showToast(
        msg: "Technician Details has been saved, Congratulations.");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                // child: Image.asset("images/udsm.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Write Technician Details",
                style: TextStyle(
                  fontSize: 26,
                  // color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: carModelTextEditingController,
                // style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Technical College You Attended",
                  hintText: "",
                  enabledBorder: UnderlineInputBorder(
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    // color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    // color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: carNumberTextEditingController,
                // style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Nida Number",
                  hintText: " ",
                  enabledBorder: UnderlineInputBorder(
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    // color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    // color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: carColorTextEditingController,
                // style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Home Address",
                  hintText: "",
                  enabledBorder: UnderlineInputBorder(
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    // color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    // color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton(
                iconSize: 26,
                // dropdownColor: Colors.black,
                hint: const Text(
                  "Please choose your proffession",
                  style: TextStyle(
                    fontSize: 14.0,
                    // color: Colors.grey,
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue) {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
                items: carTypesList.map((car) {
                  return DropdownMenuItem(
                    // ignore: sort_child_properties_last
                    child: Text(
                      car,
                      // style: const TextStyle(color: Colors.grey),
                    ),
                    value: car,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (carColorTextEditingController.text.isNotEmpty &&
                      carNumberTextEditingController.text.isNotEmpty &&
                      carModelTextEditingController.text.isNotEmpty &&
                      selectedCarType != null) {
                    saveCarInfo();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Save Now",
                  style: TextStyle(
                    // color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

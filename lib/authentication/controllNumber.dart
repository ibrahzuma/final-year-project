import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  @override
  void initState() {
    super.initState();
    countrycode.text = '  +255';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'images/udsm.png',
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: countrycode,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "|",
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "phone"),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Phone Verification',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Request controll number',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Send Controll Number'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ]),
      ),
    ));
  }
}

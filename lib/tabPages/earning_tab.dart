// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../infoHandler/app_info.dart';
// import '../mainScreens/trips_history_screen.dart';

// class EarningsTabPage extends StatefulWidget {
//   const EarningsTabPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _EarningsTabPageState createState() => _EarningsTabPageState();
// }

// class _EarningsTabPageState extends State<EarningsTabPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey,
//       child: Column(
//         children: [
//           //earnings
//           Container(
//             color: Colors.black,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 80),
//               child: Column(
//                 children: [
//                   const Text(
//                     "your Earnings:",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Tsh ${Provider.of<AppInfo>(context, listen: false).driverTotalEarnings}",
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 60,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Commision ${Provider.of<AppInfo>(context, listen: false).driverTotalEarnings}",
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 60,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           //total number of trips
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (c) => TripsHistoryScreen()));
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/car_logo.png",
//                     width: 100,
//                   ),
//                   const SizedBox(
//                     width: 6,
//                   ),
//                   const Text(
//                     "Works Completed",
//                     style: TextStyle(
//                       color: Colors.black54,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       Provider.of<AppInfo>(context, listen: false)
//                           .allTripsHistoryInformationList
//                           .length
//                           .toString(),
//                       textAlign: TextAlign.end,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../infoHandler/app_info.dart';
import '../mainScreens/trips_history_screen.dart';

class EarningsTabPage extends StatefulWidget {
  const EarningsTabPage({Key? key}) : super(key: key);

  @override
  _EarningsTabPageState createState() => _EarningsTabPageState();
}

class _EarningsTabPageState extends State<EarningsTabPage> {
  @override
  Widget build(BuildContext context) {
    AppInfo appInfo = Provider.of<AppInfo>(context, listen: false);
    String driverTotalEarningsString = appInfo.driverTotalEarnings;
    double driverTotalEarnings = double.parse(driverTotalEarningsString);
    double commission = driverTotalEarnings * 0.15;

    return Container(
      // color: Colors.grey,
      child: 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            //earnings
            // Container(
              // color: Colors.black,
              // width: double.infinity,
              // child: Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 80),
                // child: Column(
                //   children: [
                    const Text(
                      "Works done",
                      style: TextStyle(
                        // color: Colors.grey,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Tsh $driverTotalEarningsString",
                    //   style: const TextStyle(
                    //     // color: Colors.grey,
                    //     fontSize: 60,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   "Commission $commission",
                    //   style: const TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 60,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
              //     ],
              //   ),
              // ),
            // ),
      
            //total number of trips
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => TripsHistoryScreen()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Image.asset(
                      "images/car_logo.png",
                      width: 100,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Works Completed",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        appInfo.allTripsHistoryInformationList.length.toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

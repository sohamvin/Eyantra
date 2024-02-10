// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UpdatePage extends StatelessWidget{
    final int id;
  final String note;
   final String P;
  final String N;
  final String k;
  final String temperature;
  final String ec;
  final String ph;
  final String moisture;

  const UpdatePage({
    Key? key,
    required this.id,
    required this.note,
    required this.P,
    required this.N,
    required this.k,
    required this.temperature,
    required this.ec,
    required this.ph,
    required this.moisture,
  }) : super(key: key);
  
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details "),
        backgroundColor: Color.fromARGB(255, 89, 19, 240),
        elevation: 50,
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
            top: Radius.circular(2),
          ),
        ),
      ),
      body: Center(
       child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Electrical conductivity: $ec", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nitrogen: $N", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
                       Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phosphurous: $P", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
                       Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Potassium : $k", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
                       Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Temperature: $temperature", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
                       Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ph: $ph", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
                       Container(
              margin: EdgeInsets.all(29.0),
              padding: EdgeInsets.all(29.0),
              height: 128,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Soil Moisture: $moisture", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
}
}

// class UpdatePage extends StatefulWidget {
//   final Client client;
//     final int id;
//   final String note;
//    final String P;
//   final String N;
//   final String k;
//   final String temperature;
//   final String ec;
//   final String ph;
//   final String moisture;

//   const UpdatePage({
//     Key? key,
//     required this.client,
//     required this.id,
//     required this.note,
//     required this.P,
//     required this.N,
//     required this.k,
//     required this.temperature,
//     required this.ec,
//     required this.ph,
//     required this.moisture,
//   }) : super(key: key);

//   @override
//   _UpdatePageState createState() => _UpdatePageState();
// }

// class _UpdatePageState extends State<UpdatePage> {
//   TextEditingController controller = TextEditingController();
//   TextEditingController controller1 = TextEditingController();
//   TextEditingController controller2 = TextEditingController();
//   TextEditingController controller3 = TextEditingController();
//   TextEditingController controller4 = TextEditingController();
//   TextEditingController controller5 = TextEditingController();
//   TextEditingController controller6 = TextEditingController();

//   initState(){
//     controller.text = widget.ec;
//     controller1.text = widget.N;
//     controller2.text = widget.P;
//     controller3.text = widget.k;
//     controller4.text = widget.temperature;
//     controller5.text = widget.moisture;
//     controller6.text = widget.ph;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//                 title: Text("Update"),
//                 backgroundColor: Color.fromARGB(255, 89, 19, 240), // Custom color represented as an ARGB value
//                 elevation: 50, // Set the elevation to give it a floating effect
//                 toolbarHeight: 80, // Adjust the toolbar height if needed
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(40), // Customize the radius as needed
//                     top:Radius.circular(2)
//                   ),
//                 ),
//               ),
//       body:  Center(
      
//       child:SingleChildScrollView(
      
//       child: Column(
//         children: [
//             Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                    height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter ec:"),
//                       TextField(
//                         controller: controller,
//                       ),
//                     ],
//                   ),
//                 ),
//           Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                   height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter Nitrogen:"),
//                       TextField(
//                         controller: controller1,
//                       ),
//                     ],
//                   ),
//                 ),
//            Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                    height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter Phosphurous:"),
//                       TextField(
//                         controller: controller2,
//                       ),
//                     ],
//                   ),
//                 ),
//           Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                    height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter Potasium:"),
//                       TextField(
//                         controller: controller3,
//                       ),
//                     ],
//                   ),
//                 ),
//            Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                    height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter temperature:"),
//                       TextField(
//                         controller: controller4,
//                       ),
//                     ],
//                   ),
//                 ),
//           Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                    height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter moisture:"),
//                       TextField(
//                         controller: controller5,
//                       ),
//                     ],
//                   ),
//                 ),
//          Container(
//                   margin: EdgeInsets.all(29.0),
//                   padding: EdgeInsets.all(29.0),
//                   height: 128,
//                   width: 700,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(19.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Enter pH:"),
//                       TextField(
//                         controller: controller6,
//                       ),
//                     ],
//                   ),
//                 ),
//          ElevatedButton(
//                 onPressed: () async {
//                   // Get the text from the TextField
//                   String N = controller1.text.toString();
//                   String P = controller2.text.toString();
//                   String k = controller3.text.toString();
//                   String ec = controller.text.toString();
//                   String temperature = controller4.text.toString();
//                   String rain = controller5.text.toString();
//                   String ph = controller6.text.toString();

//                   Response response = await widget.client.put(
//                           //   Uri.parse("http://127.0.0.1:8000/api/models/${widget.id}/update/"),
//                           //   body: {
//                           //     'N': N,
//                           //     'P': P,
//                           //     'k': k,
//                           //     'ec': ec,
//                           //     'temperature': temperature,
//                           //     'ph': ph,
//                           //     'moisture': rain,
//                           //   },
//                           // );
                          
//                           // Uri.parse("http://192.168.1.10:8000/api/models/${widget.id}/update/"),
//                           Uri.parse("http://192.168.141.75:8000/api/models/${widget.id}/update/"),
//                             body: {
//                               'N': N,
//                               'P': P,
//                               'k': k,
//                               'ec': ec,
//                               'temperature': temperature,
//                               'ph': ph,
//                               'moisture': rain,
//                             },
//                           );
  

//                           // Check if the request was successful
//                           if (response.statusCode == 200) {
//                             // Note created successfully, close the CreatePage
//                             Navigator.pop(context);
//                           } else {
//                             // Handle prediction or other response
//                             try {
//                               // Try to parse the response body as JSON
//                               Map<String, dynamic> errorResponse = json.decode(response.body);

//                               // Display the prediction
//                               print("Prediction from server: ${errorResponse['prediction']}");
                              
                           
//                             } catch (e) {
//                               // If parsing fails, print the entire response body
//                               print("Error creating note: ${response.body}");
//                             }
//                           }
//                       },
//                 child: Text(
//                       "Update",
//                       style: TextStyle(
//                         color: Colors.white, // Set your desired text color here
//                       ),
//                     ),

//                  style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 89, 19, 240)), // Set your desired color here
//                     ),
                                  
//               )


//         ],
//       ),
//       ),

//     ),
//       // body: Column(
//       //   children: [
//       //     TextField(
//       //       controller: controller,
//       //     ),
//       //    ElevatedButton(
//       //       onPressed: () async {
//       //         // Get the text from the TextField
//       //         String noteBody = controller.text;

//       //         // Send a POST request with the note body
//       //         Response response = await widget.client.put(
//       //           Uri.parse("http://127.0.0.1:8000/api/notes/${widget.id}/update/"),
//       //           body: {'body': noteBody}, // Include the note body in the request
//       //         );

//       //         // Check if the request was successful
//       //         if (response.statusCode == 200) {
//       //           // Note created successfully, close the UpdatePage
//       //           Navigator.pop(context);
//       //         } else {
//       //           // Handle error, e.g., display an error message
//       //           print("Error creating note: ${response.body}");
//       //         }
//       //       },
//       //       child: Text("Create Note"),
//       //   )

//       //   ],
//       // ),
//     );
//   }
// }
import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final Client client;

  const CreatePage({
      Key? key,
      required this.client,
    }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Text("Create a model"),
                backgroundColor: Color.fromARGB(255, 89, 19, 240), // Custom color represented as an ARGB value
                elevation: 50, // Set the elevation to give it a floating effect
                toolbarHeight: 80, // Adjust the toolbar height if needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40), // Customize the radius as needed
                    top:Radius.circular(2)
                  ),
                ),
              ),


      body:  Center(
      
      child:SingleChildScrollView(
      
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
                      Text("Enter Temperature:"),
                      TextField(
                        controller: controller,
                      ),
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
                      Text("Enter Nitrogen:"),
                      TextField(
                        controller: controller1,
                      ),
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
                      Text("Enter Phosphurous:"),
                      TextField(
                        controller: controller2,
                      ),
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
                      Text("Enter Potasium:"),
                      TextField(
                        controller: controller3,
                      ),
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
                      Text("Enter Humidity:"),
                      TextField(
                        controller: controller4,
                      ),
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
                      Text("Enter Rainfall:"),
                      TextField(
                        controller: controller5,
                      ),
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
                      Text("Enter pH:"),
                      TextField(
                        controller: controller6,
                      ),
                    ],
                  ),
                ),
         ElevatedButton(
                onPressed: () async {
                  // Get the text from the TextField
                  String N = controller1.text.toString();
                  String P = controller2.text.toString();
                  String k = controller3.text.toString();
                  String temperature = controller.text.toString();
                  String humi = controller4.text.toString();
                  String rain = controller5.text.toString();
                  String ph = controller6.text.toString();

                  Response response = await widget.client.post(
                          //   Uri.parse("http://127.0.0.1:8000/api/models/create/"),
                          //   body: {
                          //     'N': N,
                          //     'P': P,
                          //     'k': k,
                          //     'temperature': temperature,
                          //     'humidity': humi,
                          //     'ph': ph,
                          //     'rainfall': rain,
                          //   },
                          // );
                          Uri.parse("http://192.168.1.10:8000/api/models/create/"),
                            body: {
                              'N': N,
                              'P': P,
                              'k': k,
                              'temperature': temperature,
                              'humidity': humi,
                              'ph': ph,
                              'rainfall': rain,
                            },
                          );
                          

                          // Check if the request was successful
                          if (response.statusCode == 200) {
                            // Note created successfully, close the CreatePage
                            Navigator.pop(context);
                          } else {
                            // Handle prediction or other response
                            try {
                              // Try to parse the response body as JSON
                              Map<String, dynamic> errorResponse = json.decode(response.body);

                              // Display the prediction
                              print("Prediction from server: ${errorResponse['prediction']}");
                              
                           
                            } catch (e) {
                              // If parsing fails, print the entire response body
                              print("Error creating note: ${response.body}");
                            }
                          }
                      },
                child: Text(
                      "Create",
                      style: TextStyle(
                        color: Colors.white, // Set your desired text color here
                      ),
                    ),

                 style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 89, 19, 240)), // Set your desired color here
                    ),
                                  
              )


        ],
      ),
      ),

    ),
    );
  }
}
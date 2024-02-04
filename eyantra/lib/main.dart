import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'create.dart';
import 'update.dart';
import 'model.dart';
import 'blutooth_connectivity.dart' as BluetoothPage;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'screens/bluetooth_off_screen.dart';
import 'screens/scan_screen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 37, 9, 97)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MlModel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Client client = http.Client();

  List<Note> notes = [];

  void initState() {
    _retrieveNotes();
    super.initState();
  }
_retrieveNotes() async {
  try {
    notes = [];

    // List response = json.decode(
    //   (await http.get(Uri.parse("http://127.0.0.1:8000/api/models/"))).body,
    // );
        List response = json.decode(
      (await http.get(Uri.parse("http://192.168.1.10:8000/api/models/"))).body,
    );

    response.forEach((element) {
  try {
   var noteData = {
  'id': element['id'], 
  'note': element['output'], 
  'P': element['P'].toString(), 
  'N': element['N'].toString(), 
  'k': element['k'].toString(), 
  'humidity': element['humidity'].toString(),
  'temperature': element['temperature'].toString(), 
  'ph': element['ph'].toString(), 
  'rainfall': element['rainfall'].toString(),
  'created': element['created'].toString(),  
};

  DateTime dateTime = DateTime.parse(noteData['created']);

    // Format the date and time string
    String formattedDate =
        'Date: ${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    String formattedTime =
        'Time: ${dateTime.hour.toString().padLeft(2, '0')}.${dateTime.minute.toString().padLeft(2, '0')}';
  noteData['created'] = '$formattedTime     $formattedDate';


if (9.50 < double.parse(noteData['ph']) || 3.20  > double.parse(noteData['ph']) ) {
  noteData['note'] = "Unsuitable_pH";
}



    notes.add(Note.fromMap(noteData));

  } catch (e) {
    print('Error parsing note data: $e');
    print('Element causing the issue: $element');
  }
});

    setState(() {});
  } catch (e) {
    print("Error fetching notes: $e");
  }
}



  // void _deleteNote(int id) {
  // client.delete(Uri.parse("http://127.0.0.1:8000/api/models/$id/delete/"));
  // print("The request to $id");
  // _retrieveNotes();
  // }
    void _deleteNote(int id) {
  client.delete(Uri.parse("http://192.168.1.10:8000/api/models/$id/delete/"));
  print("The request to $id");
  _retrieveNotes();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 89, 19, 240), // Custom color represented as an ARGB value
        elevation: 8, // Set the elevation to give it a floating effect
        toolbarHeight: 80, // Adjust the toolbar height if needed
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(40), // Customize the radius as needed
        top:Radius.circular(2)
        ),
      ),
        
      ),
      body: RefreshIndicator(
        onRefresh: () async { 
          _retrieveNotes();
         },
        child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
                title: Text(notes[index].note),
                subtitle: Text('${notes[index].created}'),
                onTap: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UpdatePage(
                      client:client,
                      id:notes[index].id,
                      note: notes[index].note,
                      temperature: notes[index].temperature,
                      humidity: notes[index].humidity,
                      ph:notes[index].ph,
                      rainfall: notes[index].rainfall,
                      N: notes[index].N,
                      P:notes[index].P,
                      k: notes[index].k
                      )),
                    );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteNote(notes[index].id),
                ),
              );
            }
        ),
      ),
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
     FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreatePage(client: client),
              ),
            );
          },
          tooltip: 'Add Note',
          child: const Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 89, 19, 240),
        ),
        SizedBox(height: 16),
        FloatingActionButton(
         onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BluetoothPage.FlutterBlueApp(),
              ),
            );
          },

          tooltip: 'Bluetooth Connection',
          child: const Icon(Icons.bluetooth),
          backgroundColor: Color.fromARGB(255, 89, 19, 240),
        ),
        
         ],
    ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



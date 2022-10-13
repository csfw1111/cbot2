import 'package:flutter/material.dart';

import 'dart:ui' as ui;
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cbot 🐣💓',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: '💭 Cbot - Always Here with You ❤'),
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
  String _dialog = (DateTime.now().month == 10 && DateTime.now().day == 25) ? 'Happy Birthday!! Gayauuu for everything, I always support you dik!!😁😤😸❤' : 'Keep the Smile, You Worth It.';
  int _imgIdx = (DateTime.now().month == 10 && DateTime.now().day == 25) ? 13 : 12;

  void _generateImage() {
    setState(() {
      if (DateTime.now().month == 10 && DateTime.now().day == 25) {
        if (_imgIdx != 13) {
          _imgIdx++;
        } else {
          _imgIdx = 1;
        }
      } else {
        if (_imgIdx != 12) {
          _imgIdx++;
        } else {
          _imgIdx = 1;
        }
      }
    });
  }

  void _generateTodayDialog() {
    var currDat = DateTime.now();
    int currYear = currDat.year;
    int currMonth = currDat.month;
    int currDay = currDat.day;
    int idx = 0;

    for (int i = 1; i < currMonth; ++i) {
      switch (i){
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
        idx += 31;
        break;
        case 2:
          if (currYear % 4 == 0) {
            idx += 29;
          } else {
            idx += 28;
          }
          break;
        case 4: case 6: case 9: case 11:
        idx += 30;
        break;
      }
    }
    idx += currDay;
    idx--;

    idx = 0; // TODO

    setState((){
      _dialog = _todayData.elementAt(idx);
    });
  }

  void _generateTiredDialog(){
    int randIdx = Random().nextInt(10); //TODO
    setState((){
      _dialog = _tiredData.elementAt(randIdx);
    });
  }

  void _generateNotHappyDialog(){
    int randIdx = Random().nextInt(15); //TODO
    setState((){
      _dialog = _notHappyData.elementAt(randIdx);
    });
  }

  Future<void> _launchUrl() async {
    int randIdx = Random().nextInt(5); //TODO
    final url = Uri.parse(_igLinkData.elementAt(randIdx));
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), //apply padding horizontal or vertical only
                child: Text(
                  _dialog,
                  textAlign: TextAlign.center,
                  style: (_imgIdx == 13) ? TextStyle(
                    fontSize: (MediaQuery.of(context).size.width > 600) ? 28 : 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ) : TextStyle(
                    fontSize: (MediaQuery.of(context).size.width > 600) ? 25 : 21,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), //apply padding horizontal or vertical only
                child: GestureDetector(
                    onTap: _generateImage,
                    child: (_imgIdx == 13) ? Image.asset(
                        '${'images/$_imgIdx'}.jpg',
                        width:(MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width/2 : MediaQuery.of(context).size.width
                    )
                        : Image.asset(
                        '${'images/$_imgIdx'}.jpg',
                        height: (MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width/2.7 : MediaQuery.of(context).size.width-40,
                        width:(MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width/2.7 : MediaQuery.of(context).size.width-40
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5), //apply padding horizontal or vertical only
                child: SizedBox(
                  width:(MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width/2 : double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: _generateTodayDialog,
                    child: const Text(
                      'What I want to tell you today...',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5), //apply padding horizontal or vertical only
                child: SizedBox(
                  width:(MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width/2 : double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: _generateTiredDialog,
                    child: const Text(
                      'When you are tired, press this...',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5), //apply padding horizontal or vertical only
                child: SizedBox(
                  width:(MediaQuery.of(context).size.width > 600) ? MediaQuery.of(context).size.width/2 : double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: _generateNotHappyDialog,
                    child: const Text(
                      'When you are not happy, press this...',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchUrl,
        tooltip: 'ig',
        child: const Icon(Icons.add_reaction_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final List<String> _todayData = [
    // TODO: 366 sentences in total
    'Button 1 text - some sample text, some sample text, some sample text',
    'Button 1 text - some sample text, some sample text, some sample text2',
    'Button 1 text - some sample text, some sample text, some sample text3',
    'Button 1 text - some sample text, some sample text, some sample text4',
    'Button 1 text - some sample text, some sample text, some sample text5',
    'Button 1 text - some sample text, some sample text, some sample text6',
    'Button 1 text - some sample text, some sample text, some sample text7',
    'Button 1 text - some sample text, some sample text, some sample text8',
    'Button 1 text - some sample text, some sample text, some sample text9',
    'Button 1 text - some sample text, some sample text, some sample text10',
    'Button 1 text - some sample text, some sample text, some sample text11',
  ];

  final List<String> _tiredData = [
    // TODO: 100 sentences in total
    'Button 2 text - some sample text',
    'Button 2 text - some sample text, some sample text2',
    'Button 2 text - some sample text, some sample text3',
    'Button 2 text - some sample text, some sample text4',
    'Button 2 text - some sample text, some sample text5',
    'Button 2 text - some sample text, some sample text6',
    'Button 2 text - some sample text, some sample text7',
    'Button 2 text - some sample text, some sample text8',
    'Button 2 text - some sample text, some sample text9',
    'Button 2 text - some sample text, some sample text10',
  ];

  final List<String> _notHappyData = [
    // TODO: 100 sentences in total
    'Button 3 text - some sample text, some sample text, some sample text',
    'Button 3 text - some sample text, some sample text, some sample text2',
    'Button 3 text - some sample text, some sample text, some sample text3',
    'Button 3 text - some sample text, some sample text, some sample text4',
    'Button 3 text - some sample text, some sample text, some sample text5',
    'Button 3 text - some sample text, some sample text, some sample text6',
    'Button 3 text - some sample text, some sample text, some sample text7',
    'Button 3 text - some sample text, some sample text, some sample text8',
    'Button 3 text - some sample text, some sample text, some sample text9',
    'Button 3 text - some sample text, some sample text, some sample text10',
    'Button 3 text - some sample text, some sample text, some sample text11',
    'Button 3 text - some sample text, some sample text, some sample text12',
    'Button 3 text - some sample text, some sample text, some sample text13',
    'Button 3 text - some sample text, some sample text, some sample text14',
    'Button 3 text - some sample text, some sample text, some sample text15',
  ];

  final List<String> _igLinkData = [
    'https://www.instagram.com/reel/CjUzWebrfCX/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTzGVCVKe3Z/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTwbDYdAZiy/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTiiZILhmeE/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTrRvQ5AM6b/?igshid=YmMyMTA2M2Y=',
  ];
}

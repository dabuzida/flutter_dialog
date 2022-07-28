import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialog/dialogg.dart';
import 'package:flutter_dialog/alert_dialogg.dart';
import 'package:flutter_dialog/show_dialogg.dart';
import 'package:flutter_dialog/simple_dialogg.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context);
    return MaterialApp(
      title: 'Dialog',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Dialog'),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  await _showDialog(context);
                },
                child: Text('btn'),
              ),
              const SizedBox(width: 50),
              // MyWidget(),
              // TextButton(
              //   style: TextButton.styleFrom(
              //     textStyle: const TextStyle(fontSize: 20, color: Colors.white),
              //     backgroundColor: Colors.amber,
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (BuildContext context) {
              //           return const AlertDialogg();
              //         },
              //       ),
              //     );
              //   },
              //   child: const Text('alert dialog\n(TextButton)'),
              // ),
              // const SizedBox(width: 50),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     textStyle: const TextStyle(fontSize: 20),
              //     primary: Colors.pink,
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (BuildContext context) {
              //           return const SimpleDialogg();
              //         },
              //       ),
              //     );
              //   },
              //   child: const Text('simple dialog\n(ElevatedButton)'),
              // ),
              // const SizedBox(width: 50),
              // OutlinedButton(
              //   style: OutlinedButton.styleFrom(
              //     textStyle: TextStyle(
              //       fontSize: 20,

              //       // color: Colors.red,
              //       // backgroundColor: Colors.black,
              //     ),
              //     backgroundColor: Colors.green,
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (BuildContext context) {
              //           return const ShowDialogg();
              //         },
              //       ),
              //     );
              //   },
              //   child: const Text('show dialog\n(OutlinedButton)'),
              // ),
            ],
          ),
        ),
        // body: const Dialogg(),
        // body: const AlertDialogg(),
        // body: const SimpleDialogg(),
        // body: const ShowDialogg(),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('x'),
          content: Text('http://naver.com'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Clipboard.setData(ClipboardData(text: 'http://naver.com'));
                // await _confirmDialogue();
              },
              child: Text('y'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('z'),
            ),
          ],
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context);
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, color: Colors.white),
        backgroundColor: Colors.amber,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const AlertDialogg();
            },
          ),
        );
      },
      child: const Text('alert dialog\n(TextButton)'),
    );
  }
}

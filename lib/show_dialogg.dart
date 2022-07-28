import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowDialogg extends StatefulWidget {
  const ShowDialogg({Key? key}) : super(key: key);

  @override
  State<ShowDialogg> createState() => _ShowDialoggState();
}

class _ShowDialoggState extends State<ShowDialogg> {
  String _uri = 'https://www.naver.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(color: Colors.red[900]!, width: 10),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'SimpleDialog',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '어떤 아이스크림을 드시겠습니까?',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[Color(0xFF0D47A1), Color(0xFF1976D2), Color(0xFF42A5F5)],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              print('-start-');
                              final x = await _showSimpleDialog();
                              print(x);
                              print('-end-');
                            },
                            child: Text('선택하기')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.yellow, width: 10),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    'AlertDialog',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '계약하시겠습니까?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[Color(0xFF0D47A1), Color(0xFF1976D2), Color(0xFF42A5F5)],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            final x = await _showAlertDialog();
                            print(x);
                          },
                          child: Text('계약하기'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[Color.fromARGB(255, 161, 13, 50), Color.fromARGB(255, 130, 210, 25), Color.fromARGB(255, 66, 108, 245)],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            print('-start-');
                            _showAlertDialog();
                            // final x = await _showAlertDialog();
                            // print(x);
                            print('-end-');

                            // Clipboard.setData(ClipboardData(text: x));
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     // behavior: SnackBarBehavior.fixed,
                            //     content: Text("복사되었습니다"),
                            //   ),
                            // );
                          },
                          child: Text('URI 복사'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showSimpleDialog() {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('아이스크림 선택하기'),
          children: <Widget>[
            SimpleDialogOption(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 1)),
                child: Text('스크류 바'),
              ),
              onPressed: () {
                print(1);
                Navigator.pop(context, '스크류 바');
              },
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.pink, width: 1)),
              child: SimpleDialogOption(
                child: Text('메로나'),
                onPressed: () {
                  print(2);
                  Navigator.pop(context, '메로나');
                },
              ),
            ),
            Container(
              width: 100,
              height: 900,
              color: Colors.teal,
              alignment: Alignment.center,
              child: Text(
                '스크롤도 가능',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red[900]!, width: 10)),
              child: SimpleDialogOption(
                child: Text('요맘떼'),
                onPressed: () {
                  print(3);
                  Navigator.pop(context, '요맘떼');
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _showAlertDialog() {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('20년 장기계약'),
          content: const Text('계약을 파기할 수 없습니다\n\n스크롤은 안됨'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: 'aaaaaaaaaa'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    // behavior: SnackBarBehavior.floating,
                    content: Text("복사되었습니다"),
                  ),
                );

                Navigator.pop(context, _uri);
              },
              child: const Text('복사'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OKKKK'),
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

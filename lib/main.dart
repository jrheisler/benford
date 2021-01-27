import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_strategy/url_strategy.dart';

import 'get_benford.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Benford',
      home: _ClipboardExample(),
    );
  }
}

class _ClipboardExample extends StatefulWidget {
  @override
  _ClipboardExampleState createState() => _ClipboardExampleState();
}

class _ClipboardExampleState extends State<_ClipboardExample> {
  String _textValue = '';

  /*void _setClipboard() async {
    ClipboardData data = ClipboardData(text: 'My Text');
    await Clipboard.setData(data);
  }*/

  void _getClipboard() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    setState(() {
      _textValue = data.text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
            child: Text('Paste Spreadsheet column'),
            onPressed: () {
              _getClipboard();
            },
          )
        ],
        title: Text('Benford'),
      ),
      body: Center(child: GetBenford(_textValue)),
    );
  }
}

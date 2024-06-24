import 'package:flutter/material.dart';
import 'package:notification_plugin/notification_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Phần 2. Hướng dẫn tạo Widget với plugin
              SampleButton(
                text: "Sample Button",
                onPressed: () {
                  print("zzz");
                  SampleCallNative.isToday(DateTime.now());
                },
              ),
              FutureBuilder<String?>(
                future: SampleCallNative.platformVersion,
                builder: (_, snapshoot) {
                  return Text(snapshoot.data ?? '');
                },
              ),
              FutureBuilder<bool?>(
                future: SampleCallNative.isToday(DateTime.now()),
                builder: (_, snapshoot) {
                  return Text('isToDay: ${DateTime.now()} is ${snapshoot.data}');
                },
              ),
              FutureBuilder<bool?>(
                future: SampleCallNative.isToday(DateTime(2021,01,01)),
                builder: (_, snapshoot) {
                  return Text('isToDay: ${DateTime(2021,01,01)} is ${snapshoot.data}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

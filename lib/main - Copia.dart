import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Perfil pessoal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const photo = CircleAvatar(
      backgroundImage: NetworkImage(
          'https://avatars.githubusercontent.com/u/56978621?s=400&u=e7dd8054effedddee8126e9e62dda2b0097f78f6&v=4'),
      radius: 150,
    );
    const name = Text(
      'Ivan Henriques da Silva',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
    final buttonPhone = IconButton(
      color: Colors.blue,
      icon: const Icon(Icons.phone),
      onPressed: () {
        launchUrl(
          Uri(
            scheme: 'tel',
            path: '11 99919-6401',
          ),
        );
      },
    );
    final buttonMail = IconButton(
      color: Colors.blue,
      icon: const Icon(Icons.mail),
      onPressed: () {
        launchUrl(
          Uri(
            scheme: 'mailto',
            path: 'ivanhenriques@gmail.com',
          ),
        );
      },
    );
    final buttonSMS = IconButton(
      color: Colors.blue,
      icon: const Icon(Icons.sms),
      onPressed: () {
        launchUrl(
          Uri(
            scheme: 'sms',
            path: '11 99919-6401',
          ),
        );
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          photo,
          name,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buttonPhone, buttonMail, buttonSMS],
          ),
        ],
      ),
    );
  }
}

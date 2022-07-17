import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Termômetro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Termômetro'),
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
  //variables
  int degrees = 25;
  bool state = true;

  //functions
  void increase() {
    setState(() {
      if (degrees < 30) degrees++;
    });
  }

  void decrease() {
    setState(() {
      if (degrees > 0) degrees--;
    });
  }

  @override
  Widget build(BuildContext context) {
    //widgets
    const decor = BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/weather.png'),
        fit: BoxFit.fitWidth,
      ),
    );

    final degreestxt = Text(
      '$degreesº C',
      style: TextStyle(
        fontSize: 90,
        fontWeight: FontWeight.bold,
        color: degrees > 18 ? Colors.deepOrange : Colors.indigo,
      ),
      textAlign: TextAlign.center,
    );

    final temptxt = Text(
      degrees <= 18 ? 'Está frio' : 'Está calor',
      style: TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        color: degrees > 18 ? Colors.red[800] : Colors.blue[900],
      ),
      textAlign: TextAlign.center,
    );

    const plustext = Text(
      '+',
      style: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    const minustext = Text(
      '-',
      style: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    const offtext = Text(
      'ϴ',
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
    );

    final buttonplus = TextButton(
      onPressed: degrees == 30 ? null : increase,
      style: TextButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: const Size(60, 60),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.yellow,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child: plustext,
    );

    final buttonminus = TextButton(
      onPressed: degrees == 0 ? null : decrease,
      style: TextButton.styleFrom(
        backgroundColor: Colors.redAccent,
        fixedSize: const Size(60, 60),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.yellow,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child: minustext,
    );

    final buttonoff = TextButton(
      onPressed: () {
        state = !state;
        state == false ? null : '';
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.indigo,
        fixedSize: const Size(50, 50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.lightBlue,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: offtext,
    );

    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Container(
        decoration: decor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            degreestxt,
            const SizedBox(height: 200),
            temptxt,
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buttonplus, const SizedBox(width: 50), buttonminus],
            ),
            const SizedBox(height: 30),
            buttonoff,
          ],
        ),
      ),
    );
  }
}

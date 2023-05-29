import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test MPP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Home Test MPP'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BtnContact()
          ]
        )
      ),
    );
  }
}

class ContactPage extends StatelessWidget{
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page contact'),
      ),
      body: ListView(
        //child: const Column(
          children: const [
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
            CardContact(),
          ],
        //)
      ),
    );
  }
}

class CardContact extends StatelessWidget {
  const CardContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Renaud F",style: TextStyle(fontSize: 18)),
                Text("0606060606",style: TextStyle(fontSize: 14)),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class BtnContact extends StatelessWidget {
  const BtnContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> const ContactPage()),
        );
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('Page contact'),
    );
  }
}

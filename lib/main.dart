import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
        fontFamily: 'Georgia'
      ),
      home: const HomePage(title: 'Home Test MPP'),
      debugShowCheckedModeBanner: false,

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
  //List<int> bottom = <int>[0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              print("add");
            },
          )
        ],
      ),
      body: ListView(
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
      ),
    );
  }
}

class CardContact extends StatelessWidget {
  const CardContact({
    super.key,
  });
  
  void launchURLL(Uri url) async{
    if (await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.grey,
      child: InkWell(
        onTap: () {
          Uri url = Uri.parse('https://www.google.fr/');
          launchURLL(url);
        },
        child: const SizedBox(
          width: 300,
          height: 150,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Renaud F",style: TextStyle(fontSize: 18)),
                  Text("0606060606",style: TextStyle(fontSize: 14)),
                  PopupPhone()
                ]
              ),
            ),
          ),
        ),
      )
    );
  }
}

class PopupPhone extends StatelessWidget {
  const PopupPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Clipboard.setData(const ClipboardData(text: "0606060606"));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Numéro de téléphone copier '),
          duration: const Duration(milliseconds: 3000),
          width: 300, // Width of the SnackBar.
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
       );
      },
      child: const Icon(Icons.phone),
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

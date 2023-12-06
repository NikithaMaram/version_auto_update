import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Multi-Page App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page 1'),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page lets see how the service worker works ',
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CardListScreen()));
              },
              child: Text('Go to cards Pages'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1()));
              },
              child: Text('Go to hp 1'),
            ),

          ],
        ),
      ),
    );
  }
}

class CardListScreen extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(title: 'Card 1', content: 'Details for Card 1'),
    CardItem(title: 'Card 2', content: 'Details for Card 2'),
    CardItem(title: 'Card 3', content: 'Details for Card 3'),
    // Add more card items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card List'),
      ),
      body: ListView.builder(
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showCardDetailsDialog(context, cardItems[index]);
            },
            child: Card(
              child: ListTile(
                title: Text(cardItems[index].title),
                subtitle: Text('Tap to view details'),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCardDetailsDialog(BuildContext context, CardItem cardItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(cardItem.title),
          content: Text(cardItem.content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class CardItem {
  final String title;
  final String content;

  CardItem({required this.title, required this.content});
}

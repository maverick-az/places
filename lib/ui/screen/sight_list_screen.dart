import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список интересных мест'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        //backgroundColor: Colors.green,
        child: ListView(
          children: const [
            DrawerHeader(
              child: Center(
                child: Text('Заголовок'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_mall),
              title: Text('Магазины'),
            ),
            ListTile(
              leading: Icon(Icons.local_restaurant),
              title: Text('Рестораны'),
            ),
            ListTile(
              leading: Icon(Icons.theater_comedy),
              title: Text('Театры'),
            ),
            ListTile(
              leading: Icon(Icons.local_movies),
              title: Text('Кино'),
            ),
            ListTile(
              leading: Icon(Icons.park),
              title: Text('Парки'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Hello!'),
            TextField(),
          ],
        ),
      ),
    );
  }
}

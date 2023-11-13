import 'package:flutter/material.dart';
import 'package:support_shop/widgets/left_drawer.dart';
import 'package:support_shop/widgets/support_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<SupportItem> listicon = [
    SupportItem("Lihat Item", Icons.checklist, Colors.red),
    SupportItem("Tambah Item", Icons.add_shopping_cart, Colors.yellow),
    SupportItem("Logout", Icons.logout, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Support Shop',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Support Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: listicon.map((SupportItem produk) {
                  return SupportCard(produk);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
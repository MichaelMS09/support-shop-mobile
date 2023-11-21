import 'package:flutter/material.dart';
import 'package:support_shop/screens/supportlist_form.dart';
import 'package:support_shop/screens/supportlist_item.dart';
import 'package:support_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class SupportCard extends StatelessWidget {
  final SupportItem item;

  const SupportCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Material(
      color: item.color,
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Item") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SupportFormPage()));
          }
          else if (item.name == "Lihat Item") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShowSupportPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                "http://10.0.2.2/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }

        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SupportItem {
  final String name;
  final IconData icon;
  final Color color;

  SupportItem(this.name, this.icon, this.color);
}

class Item {
  final String name;
  final String category;
  final int amount;
  final int price;
  final String description;

  Item({
    required this.name,
    required this.category,
    required this.amount,
    required this.price,
    required this.description,
  });
}
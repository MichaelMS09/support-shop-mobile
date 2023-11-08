Nama        : Michael Marcellino Satyanegara

NPM         : 2206083325

Kelas       : PBP E

[Tugas 7](#tugas-7)

# Tugas 7

## Checklist Tugas

*Checklist* untuk tugas ini adalah sebagai berikut.

### A. Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*.
#### 1. Membuat sebuah program Flutter baru dengan tema *inventory* seperti tugas-tugas sebelumnya.
1. Pastikan bahwa kita sudah *download* Flutter versi terkini (*latest version*) dan telah menjalankan tahap *Android Setup*.
2. Instal IDE pilihan kamu yang akan digunakan untuk mengembangkan aplikasi Flutter, bisa dengan menggunakan **Android Studio** atau **Visual Studio Code**.
3. Buka Terminal atau *Command Prompt* pada direktori yang ingin digunakan untuk membuat proyek Flutter.
4. *Generate* proyek Flutter baru dengan nama yang kalian inginkan dengan menjalankan perintah berikut.
    
    ```
    flutter create <APP_NAME>
    cd <APP_NAME> //Untuk masuk ke direktori proyek flutter
    ```
5. Jalankan proyek Flutter dengan perintah berikut.

    ```
    flutter run
    ```
6. Lalu pilih *connected device* (*Windows, Chrome, Edge*) yang akan digunakan untuk menampilkan proyek Flutter.
#### 2.  Membuat tiga tombol sederhana dengan ikon dan teks
1. Pada direktori utama proyek Flutter terdapat direktori dengan nama `lib`, buatlah *file* baru dengan nama `menu.dart` pada direktori tersebut dan tambahkan kode berikut.

    ```dart
    import 'package:flutter/material.dart';
    ```
2. Dari file `main.dart` yang berada pada direktori `lib`, pindahkan kode berikut ke dalam file `menu.dart`.

    ```dart
    class MyHomePage ... {
        ...
    }

    class _MyHomePageState ... {
        ...
    }
    ```
3. Pada file `main.dart` tambahkan kode berikut agar tidak terjadi *error*.

    ```dart
    import 'package:<Flutter Name>/menu.dart';
    ```
4. Pada file `main.dart`, hapus `MyHomePage(title: 'Flutter Demo Home Page')` dan ubah dengan kode berikut.

    ```dart
    MyHomePage()
    ```
5. Pada file `menu.dart`, ubah kode `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);` dan hapus bagian final String title; sampai bawah serta tambahkan *Widget build* sampai kode terlihat seperti ini.

    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
6. *Define* tipe pada list kamu, untuk menambahkan teks dan card, dengan menambahkan kode berikut pada `menu.dart`.

    ```dart
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
    }
    ```
7. Lalu dibawah kode `MyHomePage({Key? key}) : super(key: key);` tambahkan kode berikut.

    ```dart
    final List<ShopItem> items = [
        ShopItem("Lihat Produk", Icons.checklist),
        ShopItem("Tambah Produk", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    ```
8. Selanjutnya tambahkan kode berikut untuk menambahkan *widget build*.

    ```dart
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '<Flutter Name>',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  '<Flutter Name>', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    ```
9. Tambahkan kode berikut untuk membuat *widget stateless* baru untuk menampilkan card.

    ```dart
    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: Colors.indigo,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
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
    ```
#### 3. Memunculkan `Snackbar`

    ```dart
    @override
    Widget build(BuildContext context) {
        ...
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
        ...
    ```

### B. Apa perbedaan utama antara *stateless* dan *stateful widget* dalam konteks pengembangan aplikasi Flutter?

1. *Stateless Widget*

    - *Stateless widget* adalah *widget* yang tidak memiliki keadaan internal (*stateless*) dan bersifat statis. Artinya, sekali dibangun, tampilan dan perilaku widget ini tidak akan berubah.
    - Stateless widget digunakan untuk komponen yang tidak perlu memperbarui tampilan mereka berdasarkan perubahan data. Contohnya, widget untuk menampilkan teks statis, gambar, ikon, tombol yang tidak berubah.
    - Karena mereka tidak memiliki keadaan internal, *stateless widget* lebih efisien dalam hal kinerja dan penggunaan memori.

2. *Stateful Widget*

    - *Stateful widget*, sebaliknya, memiliki keadaan internal dan dapat merespons perubahan data atau tindakan pengguna. Mereka memungkinkan Anda untuk memperbarui tampilan *widget* secara dinamis sesuai dengan perubahan data atau interaksi pengguna.
    - *Stateful widget* digunakan untuk komponen yang perlu memantau dan merespons perubahan, seperti formulir *input*, daftar yang dapat digulir, layar dengan banyak *tab*, dan banyak lagi.
    - Keadaan *widget* disimpan dalam objek yang disebut *"State"* yang terkait dengan *widget* tersebut. Ketika perlu memperbarui *widget*, *"State"* akan diperbarui.

### C. Sebutkan seluruh *widget* yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

1. `main.dart`
    - **MyApp**: *widget* utama yang bersifat *StatelessWidget* dan berfungsi menetapkan tema aplikasi dan menentukan MyHomePage sebagai *home* aplikasi. 
    - **MaterialApp**: *widget* untuk membuat aplikasi Flutter. Berfungsi untuk menyediakan beberapa parameter, seperti *title, theme*, dan *home*.
2. `menu.dart`
    - **MyHomePage**: *widget* utama yang berperan sebagai halaman utama dari aplikasi. Ini adalah *widget StatelessWidget* yang memiliki daftar <Flutter Name> dan menggunakan `GridView.count` untuk menampilkan daftar <Flutter Name>. 
    - **ShopCard**: *widget StatelessWidget* yang mewakili <Flutter Name> *card*. Ini menampilkan ikon, teks, dan warna yang terkait dengan item yang diberikan.
    
    - Widget lain yang digunakan, seperti `Scaffold, AppBar, SingleChildScrollView, Padding, Column, GridView.count, InkWell, Container, Center, Icon, Text, SnackBar`, adalah bagian dari Flutter SDK dan digunakan untuk mengatur tata letak dan menampilkan elemen UI.
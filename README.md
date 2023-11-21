Nama        : Michael Marcellino Satyanegara

NPM         : 2206083325

Kelas       : PBP E

[Tugas 7](#tugas-7)

[Tugas 8](#tugas-8)

[Tugas 9](#tugas-9)

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
1. Pada file `menu.dart` tambahkan kode berikut untuk memunculkan `Snackbar`
    
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

# Tugas 8

## Checklist Tugas

*Checklist* untuk tugas ini adalah sebagai berikut.

### A. Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*.

#### 1. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru.
1. Buatlah direktori dengan nama `widgets` pada direktori `lib`, lalu tambahkan file dengan nama `appname_form.dart`. Tambahkan kode berikut pada file

    ```dart
    import 'package:flutter/material.dart';
    import 'package:gameshop/widgets/left_drawer.dart';

    class ShopFormPage extends StatefulWidget {
        const ShopFormPage({super.key});

        @override
        State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
        @override
        Widget build(BuildContext context) {
            return Placeholder();
        }
    }
    ```
2. Pada bagian `return Placeholder()`, ubah bagian tersebut dengan kode berikut

    ```dart
    Scaffold(
    appBar: AppBar(
        title: const Center(
        child: Text(
            'Form Tambah Item',
        ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
    ),
    drawer: const LeftDrawer(),
    body: Form()
    )
    ```

3. Buatlah variabel baru bernama `_formkey` lalu tambahkan variabel tersebut pada atribut `key` yang ada pada `body: Form()`

    ```dart
    ...
    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
    ...
    ```
    ```dart
    ...
    body: Form(
        key: _formKey,
        child: SingleChildScrollView(),
    ),
    ...
    ```

    > Penjelasan: Atribut `key` akan berfungsi sebagai *handler* dari *form state*, validasi *form*, dan penyimpanan *form*.

4. Tambahkan beberapa atribut yang akan digunakan sebagai *field* pada widget `form`.

    ```dart
    ...
    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _price = 0;
        String _description = "";
    ...
    ```

5. Buatlah widget `Column` sebagai *child* dari `SingleChildScrollView()` dan pada widget `Column` buatlah widget `TextFormField` yang dibungkus oleh `Padding`. Setelah itu, tambahkan atribut `crossAxisAlignment` untuk mengatur alignment *children* dari `Column`.

    ```dart
    ...
    body: Form(
        key: _formKey,
        child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                            hintText: "Nama Produk",
                            labelText: "Nama Produk",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                            ),
                            onChanged: (String? value) {
                            setState(() {
                                _name = value!;
                            });
                            },
                            validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return "Nama tidak boleh kosong!";
                            }
                            return null;
                            },
                        ),
                        ),
                ...
        ),
    ...
    ```

6. Dengan kode yang sama buatkan juga `Padding` untuk validasi input kepada variabel yang menjadi *field* lainnya.

    ```dart
    ...
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
        hintText: "Harga",
        labelText: "Harga",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
        ),
        ),
        onChanged: (String? value) {
        setState(() {
            _price = int.parse(value!);
        });
        },
        validator: (String? value) {
        if (value == null || value.isEmpty) {
            return "Harga tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
            return "Harga harus berupa angka!";
        }
        return null;
        },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
        hintText: "Deskripsi",
        labelText: "Deskripsi",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
        ),
        ),
        onChanged: (String? value) {
        setState(() {
            _description = value!;
        });
        },
        validator: (String? value) {
        if (value == null || value.isEmpty) {
            return "Deskripsi tidak boleh kosong!";
        }
        return null;
        },
    ),
    ),
    ...
    ```

7. Buatlah tombol yang dibungkus dalam widget `Padding` dan `Align` sebagai *child* selanjutnya dari `Column`. Setelah itu kita akan memunculkan data secara *pop-up* setelah tombol ditekan.

    ```dart
    ...
    Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
        ),
        onPressed: () {
            if (_formKey.currentState!.validate()) {}
        },
        child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
        ),
        ),
    ),
    ),
    ...
    ```

#### 2. Mengarahkan pengguna ke halaman *form* tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
1. Pada *file* `menu.dart` sesuaikan page yang akan dimasukkan ke dalam *route stack* saat tombol tambah item ditekan.

    ```dart
    ...
    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            onTap: () {
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));

                if (item.name == "Tambah Item") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                    ),
                );
                }
            };
    ...
    ```

#### 3. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah *pop-up* setelah menekan tombol `Save` pada halaman formulir tambah item baru.

1. Sama dengan pada *step* nomor 7 bagian 1. Kita buat tombol yang dibungkus dalam widget `Padding` dan `Align` sebagai *child* selanjutnya dari `Column`. Setelah itu kita akan memunculkan data secara *pop-up* setelah tombol ditekan. Namun agar *pop-up* memunculkan data tambahkan kode berikut pada bagian `if (_formKey.currentState!.validate()) {}`

    ```dart 
    ...
    Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
        ),
        onPressed: () {
            if (_formKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    builder: (context) {
                    return AlertDialog(
                        title: const Text('Produk berhasil tersimpan'),
                        content: SingleChildScrollView (
                        child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                            Text('Nama: $_name'),
                            Text('Price: $_price'),
                            Text('Description: $_description'),
                            ],
                        ),
                        ),
                        actions: [
                        TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                            Navigator.pop(context);
                            },
                        ),
                        ],
                    );
                    },
                );
                _formKey.currentState!.reset();
            }
        },
        child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
        ),
        ),
    ),
    ),
    ...
    ```
#### 4. Membuat sebuah drawer pada aplikasi.
1. Pada direktori `lib\widgets` tambahkan *file* dengan nama `left_drawer.dart` dan tambahkan kode berikut di dalamnya.

    ```dart
    import 'package:flutter/material.dart';
    import 'package:gameshop/screens/menu.dart';
    import 'package:gameshop/screens/gameshop_form.dart';
    import 'package:gameshop/item_page.dart';

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                // TODO: Bagian drawer header
            ),
            // TODO: Bagian routing
            ],
        ),
        );
    }
    }
    ```

2. Pada bagian `TODO: Bagian routing` tambahkan kode berikut.

    ```dart
    ...
    ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => MyHomePage(),
            ));
    },
    ),
    ListTile(
    leading: const Icon(Icons.add_shopping_cart),
    title: const Text('Tambah Item'),
    onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => const SupportFormPage(),
            ));
    },
    ),
    ...
    ```

3. Pada bagian `TODO: Bagian drawer header` tambahkan kode berikut.

    ```dart
    ...
    const DrawerHeader(
    decoration: BoxDecoration(
        color: Colors.indigo,
    ),
    child: Column(
        children: [
        Text(
            'Shopping List',
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
            "Catat seluruh keperluan belanjamu di sini!",
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            ),
        ),
        ],
    ),
    ),
    ...
    ```

4. Pada *file* `menu.dart`, perbarui *file* dengan kode berikut ini.

    ```dart
    ...
    // Impor drawer widget
    import 'package:shopping_list/widgets/left_drawer.dart';
    ...
    return Scaffold(
    appBar: AppBar(
        title: const Text(
        'Shopping List',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
    ),
    // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
    drawer: const LeftDrawer(),
    ...
    ```

### B. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

1. **`Navigator.push()`**
    
    `Navigator.push()` digunakan untuk menambahkan suatu *route* ke dalam *stack route* yang dikelola oleh *Navigator*. Dengan menggunakan *method* ini, *route* yang baru ditambahkan akan berada di bagian paling atas dari *stack*, sehingga pengguna akan melihat dan ditampilkan dengan langsung *route* yang baru ditambahkan tersebut. Contoh penggunaan:

    ```dart
    ...
    if (item.name == "Tambah Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
    ...
    ```

    Pada tugas kali ini, `Navigator.push()` digunakan di dalam `MyHomePage()` pada *file* `menu.dart` untuk berpindah ke dalam halaman `ShopFormPage()` pada *file* `supportlist_form.dart`.

2. **`Navigator.pushReplacement()`**

    `Navigator.pushReplacement()` berfungsi untuk menggantikan *route* yang sedang ditampilkan kepada pengguna dengan suatu *route* baru, dengan cara menghapus *route* yang lama. Penggunaan *method* ini akan memicu perpindahan aplikasi dari *route* yang sedang ditampilkan ke *route* yang baru. Dalam *stack route* yang dikelola oleh *Navigator*, *route* yang lama di bagian atas *stack* akan langsung digantikan oleh *route* baru, tanpa memengaruhi kondisi elemen *stack* yang berada di bawahnya. Contoh penggunaan:

    ```dart
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => MyHomePage(),
    ),
    );
    ```

    `Navigator.pushReplacement()` digunakan untuk *replace stack route* yang ada di paling atas halaman `MyHomePage()`. Hal ini dilakukan agar pengguna tidak kembali ke halaman lain atau sebelumnya setelah selesai dari halaman `MyHomePage()`.

3. **Perbedaan**

    Perbedaan utama antara kedua *method* ini terletak pada cara penanganan *route* yang berada di atas *stack*. Dalam `Navigator.push()`, *route* baru akan ditambahkan di atas *route* yang sudah ada pada *stack*. Sebaliknya, dalam `Navigator.pushReplacement()`, *route* yang sudah ada pada atas *stack* akan digantikan langsung oleh *route* baru.

### C. Jelaskan masing-masing *layout widget* pada Flutter dan konteks penggunaannya masing-masing!

Dalam Flutter, *layout widget* merujuk pada *widget* yang digunakan untuk mengatur tata letak atau susunan antar-elemen dalam tampilan aplikasi. Beberapa contoh ***Layout widget*** yang umum digunakan di Flutter:

1. **Container**

    `Container` adalah *widget* yang dapat menampung dan mengatur tata letak elemen-elemen anak di dalamnya. Ini sering digunakan untuk mengatur *margin, padding*, dan dekorasi dari *widget* yang ada di dalamnya.

    ```dart
    Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
    ),
    child: Text('Hello, Flutter!'),
    )
    ```

2. **Row & Column**:

    `Row` dan `Column` adalah widget yang digunakan untuk menyusun elemen-elemen secara horizontal (untuk Row) atau vertikal (untuk Column).

    ```dart
    Row(
    children: [
        Icon(Icons.star),
        Text('5.0'),
    ],
    )

    Column(
    children: [
        Text('Title'),
        Text('Subtitle'),
    ],
    )
    ```

3. **ListView**

    `ListView`` digunakan untuk menampilkan daftar elemen secara berurutan, baik secara horizontal maupun vertikal.

    ```dart
    ListView(
    children: [
        ListTile(
        title: Text('Item 1'),
        ),
        ListTile(
        title: Text('Item 2'),
        ),
    ],
    )
    ```

4. **GridView**

    `GridView` digunakan untuk menampilkan elemen-elemen dalam susunan *grid*.

    ```dart
    GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
    ),
    itemBuilder: (context, index) {
        return Card(
        child: Text('Item $index'),
        );
    },
    )
    ```

5. **Stack**

    `Stack` digunakan untuk menumpuk elemen-elemen di atas satu sama lain. Elemen-elemen ini dapat ditumpuk dengan bebas.

    ```dart
    Stack(
    children: [
        Image.network('https://example.com/image.jpg'),
        Positioned(
        bottom: 10.0,
        left: 10.0,
        child: Text('Overlay Text'),
        ),
    ],
    )
    ```

### D. Sebutkan apa saja elemen *input* pada *form* yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

- **TextFormField**

    ```dart
    TextFormField(
        decoration: InputDecoration(
            hintText: "Nama Produk",
            labelText: "Nama Produk",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
        ),
        onChanged: (String? value) {
            setState(() {
                _name = value!;
            });
        },
        onSaved: (String? value) {
            setState(() {
                _name = value!;
            });
        },
        validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
            }
            return null;
        },
    ),
    ```

    Alasan Penggunaan: Untuk mengambil *input* variabel *field* dari pengguna. Jenis `TextFormField` digunakan karena kita ingin pengguna dapat memasukkan teks/angka sebagai *field* produk.

### E. Bagaimana penerapan *clean architecture* pada aplikasi Flutter?

Penerapan *Clean Architecture* pada aplikasi Flutter melibatkan pembagian kode ke dalam beberapa lapisan terpisah, masing-masing dengan tanggung jawab tertentu. *Clean Architecture* memberikan arsitektur yang modular dan memisahkan antara logika bisnis, logika aplikasi, dan infrastruktur. Berikut adalah panduan umum untuk menerapkan *Clean Architecture* pada aplikasi Flutter:

1. *Entities Layer*

    Tempatkan kelas-kelas yang merepresentasikan objek-objek inti atau entitas bisnis. Objek-objek ini tidak boleh bergantung pada detail teknis atau infrastruktur.

2. *Use Cases Layer*

    Tempatkan logika bisnis dan aturan penggunaan aplikasi di sini. *Use cases* tidak boleh bergantung pada infrastruktur atau *framework* tertentu. Membuat *class use case* yang merepresentasikan tugas-tugas spesifik aplikasi.

3. *Interface Layer*

    Definisikan antarmuka yang memungkinkan komunikasi antara *Use Cases Layer* dan *Interface Layer*. Biasanya berupa abstraksi seperti *Repository Interfaces*.

4. *Framework Layer*

    Tempatkan implementasi teknis, seperti akses database atau panggilan HTTP. Implementasikan antarmuka dari *Interface Layer*.

5. *Presentation Layer*

    Mengelola presentasi dan UI. Terdiri dari *widget, state management*, dan logika tampilan. Tidak boleh berisi logika bisnis, seharusnya hanya memanggil *use cases layer*.

6. *Dependency Rule*

    Semua arah dependensi harus menuju ke arah lapisan bisnis atau core, dan tidak sebaliknya. Artinya, lapisan bisnis tidak boleh bergantung pada detail implementasi teknis atau presentasi.

7. *Dependency Injection*

    Gunakan *dependency injection* untuk memasukkan dependensi dari lapisan infrastruktur ke lapisan bisnis. **Dependency injection* memastikan bahwa implementasi teknis dapat diganti tanpa merusak logika bisnis.

8. *Testability*

    Pastikan setiap lapisan dapat diuji secara terpisah. Lapisan bisnis dan use cases seharusnya memiliki *unit test* yang independen dari infrastruktur.

- **Contoh Struktur Proyek**

    ```
    /lib
    /core
        /entities
        /usecases
        /interfaces
    /data
        /repositories
        /datasources
    /presentation
        /screens
        /widgets
    /injection
    ```

- **Penjelasan**

    - *Entities Layer*: Tempatkan model bisnis atau objek-objek yang mewakili entitas inti.
    
    - *Use Cases Layer*: Berisi logika bisnis dan aturan penggunaan aplikasi.
    
    - *Interface Layer*: Berisi antarmuka atau abstraksi untuk *repository* dan sumber daya data lainnya.
    
    - *Data Layer*: Menyimpan implementasi repository dan sumber daya data.
    
    - *Presentation Layer*: Berisi *widget* Flutter, *state management*, dan logika presentasi.
    
    - *Injection Layer*: Tempatkan konfigurasi *dependency injection*.

Dengan menerapkan *Clean Architecture*, aplikasi Flutter dapat menjadi lebih modular, mudah diuji, dan lebih mudah untuk dikelola. Selain itu, pemisahan logika bisnis dari aspek teknis mempermudah pemeliharaan aplikasi dan perubahan yang dilakukan.

# Tugas 9

## Checklist Tugas

*Checklist* untuk tugas ini adalah sebagai berikut.

### A. Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*.

#### 1. Membuat halaman login pada proyek tugas Flutter.


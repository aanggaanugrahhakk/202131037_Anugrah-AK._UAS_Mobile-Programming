import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TampilanLogin(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
    );
  }
}

class TampilanLogin extends StatefulWidget {
  @override
  _TampilanLoginState createState() => _TampilanLoginState();
}

class _TampilanLoginState extends State<TampilanLogin> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Username",
              style: GoogleFonts.adventPro(fontSize: 30, height: 2.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            Text(
              "Password",
              style: GoogleFonts.akronim(fontSize: 30, height: 2.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (username == 'anugrahak' && password == 'angga31037') {
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BerandaScreen()),
                    );
                  });
                } else if (username != 'anugrahak') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Username salah')),
                  );
                } else if (password != 'angga31037') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password salah')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Masukkan Username dan Password')),
                  );
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class BerandaScreen extends StatelessWidget {
  get namaLengkap => null;
  get namaPanggilan => null;
  get tempatLahir => null;
  get kontakMediaSosial => null;
  get urlFoto => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tampilan Beranda"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                UserProfile userProfile = UserProfile(
                    namaLengkap: namaLengkap,
                    namaPanggilan: namaPanggilan,
                    tempatLahir: tempatLahir,
                    pilihanTanggal: pilihanTanggal,
                    pilihanBulan: pilihanBulan,
                    pilihanTahun: pilihanTahun,
                    pilihanJenisKelamin: pilihanJenisKelamin,
                    kontakMediaSosial: kontakMediaSosial,
                    urlFoto: urlFoto);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TampilanLihatProfil(userProfile: userProfile)),
                );
              },
              child: Text("Lihat Profil"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TampilanEditProfil()),
                );
              },
              child: Text("Edit Profil"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile {
  String namaLengkap;
  String namaPanggilan;
  String tempatLahir;
  int pilihanTanggal;
  int pilihanBulan;
  int pilihanTahun;
  String pilihanJenisKelamin;
  String kontakMediaSosial;
  String urlFoto;

  UserProfile({
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.tempatLahir,
    required this.pilihanTanggal,
    required this.pilihanBulan,
    required this.pilihanTahun,
    required this.pilihanJenisKelamin,
    required this.kontakMediaSosial,
    required this.urlFoto,
  });
}

class TampilanLihatProfil extends StatelessWidget {
  final UserProfile userProfile;
  TampilanLihatProfil({required this.userProfile}) {
    tanggalController.text = userProfile.pilihanTanggal.toString();
    bulanController.text = userProfile.pilihanBulan.toString();
    tahunController.text = userProfile.pilihanTahun.toString();
  }
  TextEditingController tanggalController = TextEditingController();
  TextEditingController bulanController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tampilan Lihat Profil"),
      ),
      body: Center(
        child: Column(
          children: [
            //Implementasi tempat menampilkan Image Network yang berasal dari isian Text Field kelima di Tampilan Edit Profil
            CircleAvatar(),
            Text(
              "Nama Lengkap",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
                readOnly: true,
                controller:
                    TextEditingController(text: userProfile.namaLengkap)),
            Text(
              "Nama Panggilan",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
                readOnly: true,
                controller:
                    TextEditingController(text: userProfile.namaPanggilan)),
            Text(
              "Tempat Tanggal Lahir",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            Text(
              "Tempat Lahir",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
                readOnly: true,
                controller:
                    TextEditingController(text: userProfile.tempatLahir)),
            Text(
              "Tanggal",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              readOnly: true,
              controller: tanggalController,
              decoration: InputDecoration(
                hintText: userProfile.pilihanTanggal.toString(),
              ),
            ),
            Text(
              "Bulan",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              readOnly: true,
              controller: bulanController,
              decoration: InputDecoration(
                hintText: userProfile.pilihanBulan.toString(),
              ),
            ),
            Text(
              "Tahun",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              readOnly: true,
              controller: tahunController,
              decoration: InputDecoration(
                hintText: userProfile.pilihanTahun.toString(),
              ),
            ),
            Text(
              "Jenis Kelamin",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
                readOnly: true,
                controller: TextEditingController(
                    text: userProfile.pilihanJenisKelamin)),
            Text(
              "Kontak / Media Sosial",
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
                readOnly: true,
                controller:
                    TextEditingController(text: userProfile.kontakMediaSosial)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}

int pilihanTanggal = 1;
List<int> tanggaltanggal = List<int>.generate(31, (index) => index + 1);

int pilihanBulan = 1;
List<int> bulanbulan = List<int>.generate(12, (index) => index + 1);

int pilihanTahun = 1999;
List<int> tahuntahun = [1999, 2000, 2001, 2002, 2003];

String pilihanJenisKelamin = 'Laki-Laki';
List<String> jeniskelaminjeniskelamin = ['Laki-laki', 'Perempuan'];

class TampilanEditProfil extends StatefulWidget {
  @override
  _TampilanEditProfilState createState() => _TampilanEditProfilState();
}

class _TampilanEditProfilState extends State<TampilanEditProfil> {
  late TextEditingController namaLengkapController;
  late TextEditingController namaPanggilanController;
  late TextEditingController tempatLahirController;
  late TextEditingController kontakMediaSosialController;
  late TextEditingController urlFotoController;

  @override
  void initState() {
    super.initState();
    namaLengkapController = TextEditingController();
    namaPanggilanController = TextEditingController();
    tempatLahirController = TextEditingController();
    kontakMediaSosialController = TextEditingController();
    urlFotoController = TextEditingController();
  }

  @override
  void dispose() {
    namaLengkapController.dispose();
    namaPanggilanController.dispose();
    tempatLahirController.dispose();
    kontakMediaSosialController.dispose();
    urlFotoController.dispose();
    super.dispose();
  }

  UserProfile userProfile = UserProfile(
    namaLengkap: "",
    namaPanggilan: "",
    tempatLahir: "",
    pilihanTanggal: 1,
    pilihanBulan: 1,
    pilihanTahun: 1999,
    pilihanJenisKelamin: 'Laki-Laki',
    kontakMediaSosial: "",
    urlFoto: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tampilan Edit Profil"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nama Lengkap",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nama Lengkap",
              ),
            ),
            Text(
              "Nama Panggilan",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nama Panggilan",
              ),
            ),
            Text(
              "Tempat Lahir",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Tempat Lahir",
              ),
            ),
            Text(
              "Tanggal",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            PopupMenuButton<int>(
              icon: Icon(Icons.arrow_drop_down),
              onSelected: (value) {
                setState(() {
                  pilihanTanggal = value;
                });
              },
              itemBuilder: (context) {
                return tanggaltanggal.map((tanggal) {
                  return PopupMenuItem<int>(
                    value: tanggal,
                    child: Text('$tanggal'),
                  );
                }).toList();
              },
            ),
            Text(
              "Bulan",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            PopupMenuButton<int>(
              icon: Icon(Icons.arrow_drop_down),
              onSelected: (value) {
                setState(() {
                  pilihanBulan = value;
                });
              },
              itemBuilder: (context) {
                return bulanbulan.map((bulan) {
                  return PopupMenuItem<int>(
                    value: bulan,
                    child: Text('$bulan'),
                  );
                }).toList();
              },
            ),
            Text(
              "Tahun",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            PopupMenuButton<int>(
              icon: Icon(Icons.arrow_drop_down),
              onSelected: (value) {
                setState(() {
                  pilihanTahun = value;
                });
              },
              itemBuilder: (context) {
                return tahuntahun.map((tahun) {
                  return PopupMenuItem<int>(
                    value: tahun,
                    child: Text('$tahun'),
                  );
                }).toList();
              },
            ),
            Text(
              "Jenis Kelamin",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              onSelected: (value) {
                setState(() {
                  pilihanJenisKelamin = value;
                });
              },
              itemBuilder: (context) {
                return jeniskelaminjeniskelamin.map((jeniskelamin) {
                  return PopupMenuItem<String>(
                    value: jeniskelamin,
                    child: Text('$jeniskelamin'),
                  );
                }).toList();
              },
            ),
            Text(
              "Kontak / Media Sosial",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            Text(
              "(berupa URL/nomor/email)",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 18,
                height: 2.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "(berupa URL/nomor/email)",
              ),
            ),
            Text(
              "Masukkan URL foto",
              style: TextStyle(
                fontFamily: 'Artifika',
                fontSize: 20,
                height: 2.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan URL foto",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userProfile = UserProfile(
                    namaLengkap: namaLengkapController.text,
                    namaPanggilan: namaPanggilanController.text,
                    tempatLahir: tempatLahirController.text,
                    pilihanTanggal: pilihanTanggal,
                    pilihanBulan: pilihanBulan,
                    pilihanTahun: pilihanTahun,
                    pilihanJenisKelamin: pilihanJenisKelamin,
                    kontakMediaSosial: kontakMediaSosialController.text,
                    urlFoto: urlFotoController.text,
                  );
                });
              },
              child: Text("Simpan"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}

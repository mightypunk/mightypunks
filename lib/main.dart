import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mightypunks/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'MightyPunks',
      initialRoute: "/landing",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/landing":
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );

          // break;
          default:
            return MaterialPageRoute(
              builder: (context) => const Center(
                child: Text("Not Found"),
              ),
            );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}//Mighty%$20
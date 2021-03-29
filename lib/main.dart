import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/viewmodels/movie_list_viewmodel.dart';
import 'package:movie_app/views/movie_detail_view.dart';
import 'package:movie_app/views/movie_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MovieListViewmodel>(
        create: (context) => MovieListViewmodel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xffFFEBCD),
        textTheme: GoogleFonts.muliTextTheme(),
      ),
      home: MovieListView(),
      themeMode: ThemeMode.dark,
    );
  }
}

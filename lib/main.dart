import 'package:flutter/material.dart';
import 'package:flutter_calender/screen/HomeScreen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'NotoSans'),
    home: HomeScreen(),
  ));
}

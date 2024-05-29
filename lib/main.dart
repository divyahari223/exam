import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_cafeapi/crafts/provider/craftprovider.dart';
import 'package:rest_cafeapi/crafts/widgets/craftfile.dart';
import 'package:rest_cafeapi/crafts/widgets/detailscreen.dart';
import 'package:rest_cafeapi/signup.dart';

import 'package:rest_cafeapi/signup/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=>craftprovider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        //  textTheme: GoogleFonts,
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  signup(),
         routes: {
         'all_products_screen':(context) =>ProductsScreen(),
           'detailscreen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return detailscreen(id: 'id',);
           }
         }
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixclone/Pages/Home_pages.dart';
import 'package:tixclone/Provider/Movie_Provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => MovieProvider())],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: HomePages()),
      ),
    );

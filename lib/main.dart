import 'package:flutter/material.dart';
import 'package:pagination_http_provider/providers.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() => runApp(MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider<PassengersProvider>(
            create: (_) => PassengersProvider())
      ],
      child: Home(),
    )));

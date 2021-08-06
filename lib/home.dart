import 'package:flutter/material.dart';
import 'package:pagination_http_provider/providers.dart';
import 'package:provider/provider.dart';

import 'components.dart';
import 'passenger_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<PassengersProvider>(context, listen: false).load();

    final passenger = Provider.of<PassengersProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Api')),
      body: FutureBuilder(
        future: passenger.isLoad,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: passenger.data.length,
                itemBuilder: (context, index) {
                  String? name, headQuaters, imgPath;
                  final data = passenger.data[index];

                  data.airline!.map((Airline e) {
                    name = e.name.toString();
                    headQuaters = e.headQuaters.toString();
                    imgPath = e.logo.toString();
                  }).toList();

                  return AirLineCard(
                      name: name!,
                      headQuaters: headQuaters!,
                      imgPath: imgPath!);
                });
          } else
            return Center(child: normalText('Loading...'));
        },
      ),
    );
  }
}

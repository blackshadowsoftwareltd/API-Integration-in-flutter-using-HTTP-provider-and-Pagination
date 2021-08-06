import 'package:flutter/material.dart';

Widget normalText(label) => Text(label,
    maxLines: 3,
    overflow: TextOverflow.visible,
    style: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500));

/// AirLine Card
class AirLineCard extends StatelessWidget {
  final String name, headQuaters, imgPath;

  AirLineCard(
      {Key? key,
      required this.name,
      required this.headQuaters,
      required this.imgPath})
      : super(key: key);
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
          width: double.infinity,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              img(imgPath),
              Container(
                  width: w! * .6,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalText('Name: $name'),
                        normalText('Head Quaters: $headQuaters')
                      ])),
            ],
          )),
    ]);
  }

  ///
  Widget img(String imgPath) => Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: w! * .3,
      height: 70,
      child: Image.network(imgPath, fit: BoxFit.contain));
}

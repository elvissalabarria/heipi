import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heipi_test_b/src/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class MyActivityScreen extends StatefulWidget {
  int count;
  String type;
  MyActivityScreen(this.count, this.type, {Key? key}) : super(key: key);

  @override
  _MyActivityScreenState createState() => _MyActivityScreenState();
}

class _MyActivityScreenState extends State<MyActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.green.shade800,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              myActivity,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                keepMoving,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black26),
              ),
            ),
            SfCartesianChart(primaryXAxis: CategoryAxis(), series: <ChartSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  borderColor: Colors.green,
                  borderWidth: 3,
                  color: Colors.green.shade200,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.green.shade100.withOpacity(0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 60,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.green.shade300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getDay(chartData),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Most Steps",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          Text(
                            "Tuesday",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "6 Kms",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade400),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(walkingsolid),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(walking),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(bikingsolid),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(cycling),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String getDay(List<ChartData> chartData) {
    final List<ChartData> temp = [];
    for (var element in chartData) {
      temp.add(element);
    }
    temp.sort(((a, b) => b.y.compareTo(a.y)));

    return temp.first.x;
  }
}

final List<ChartData> chartData = [
  ChartData('13 Sep', 10),
  ChartData('14 Sep', 11),
  ChartData('15 Sep', 9),
  ChartData('16 Sep ', 10),
  ChartData('17 Sep', 4),
  ChartData('18 Sep', 2),
  ChartData('19 Sep', 6),
  ChartData('120 Sep', 5)
];

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

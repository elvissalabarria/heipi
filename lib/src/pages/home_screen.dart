import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heipi_test_b/src/blocs/timer/timer_bloc.dart';
import 'package:heipi_test_b/src/models/data.dart';
import 'package:heipi_test_b/src/pages/my_activity_screen.dart';
import 'package:heipi_test_b/src/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String type = "Árboles sembrados";
  final count = ValueNotifier(0);
  late Duration duration;
  Timer? timer;
  final counterPlant = ValueNotifier(CounterPlant(0, 0));

  @override
  initState() {
    duration = const Duration();

    startTimerCounter();
    funtionPeriodic();
    super.initState();
  }

  void startTimerCounter() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTimer());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: ((context, state) {
        if (state is SecondTimerState) {
          duration = Duration(seconds: state.second);
        }
      }),
      child: BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Row(
                          children: const [
                            Text(
                              "Hi, Elvis",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            haveWalked,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '65%',
                            style: TextStyle(
                                color: Colors.green.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            yourGoal,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    SfCircularChart(series: <CircularSeries>[
                      RadialBarSeries<_PieData, String>(
                          dataSource: pieData,
                          innerRadius: '70%',
                          radius: '70%',
                          gap: '2%',
                          maximumValue: 100,
                          cornerStyle: CornerStyle.bothCurve,
                          xValueMapper: (_PieData data, _) => data.yData.toString(),
                          yValueMapper: (_PieData data, _) => data.yData,
                          pointColorMapper: (_PieData data, _) => data.color)
                    ]),
                    Positioned(
                      bottom: 130,
                      left: MediaQuery.of(context).size.width * 0.36,
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${counterPlant.value.step}',
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Árboles sembrados",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyActivityScreen(counterPlant.value.step, "step")));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(walkingsolid),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(walking),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyActivityScreen(counterPlant.value.bicy, "bicy")));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(bikingsolid),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(cycling),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            leaderboard,
                            style: TextStyle(color: Colors.green.shade400, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            topGruop,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(child: buildListOfTopUser(topUserList))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  funtionPeriodic() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (counterPlant.value.step > 99) {
        counterPlant.value.step = 0;
      } else {
        counterPlant.value.step++;
      }
      pieData[0].yData = counterPlant.value.step;
    });
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (counterPlant.value.bicy > 99) {
        counterPlant.value.bicy = 0;
      } else {
        counterPlant.value.bicy++;
      }
      pieData[1].yData = counterPlant.value.bicy;
    });
  }

  Widget buildListOfTopUser(List<Users> topUserList) {
    return ListView.builder(
        itemCount: topUserList.length,
        itemBuilder: (context, index) {
          return itemRowList(topUserList[index], index + 1);
        });
  }

  Widget itemRowList(Users user, int index) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${user.countPlant} Árboles',
                    style: const TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    medal + index.toString() + ".png",
                    width: 40,
                    height: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  addTimer() {
    const addSeconds = 1;
    final seconds = duration.inSeconds + addSeconds;
    BlocProvider.of<TimerBloc>(context).add(DoSecondTimerEvent(seconds));
  }

  List<_PieData> pieData = [
    _PieData(1, Color(Colors.green.shade300.value)),
    _PieData(2, Color(Colors.green.shade900.value)),
  ];
}

class _PieData {
  _PieData(this.yData, this.color);
  int yData;
  Color color;
}

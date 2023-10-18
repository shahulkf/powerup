// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:powerup/admin/add_workout.dart';
import 'package:powerup/db/db_functions.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/models/exercise_model.dart';


getProgress()async{
  final db =await Hive.openBox<ExerciseModal>(dbName);
  await getUser();
  if(user.value==null)return;
  Gender gender = getGender(user.value!.gender=='Male'?'men':'women');
  beginnerCount=0;
  intermediateCount=0;
  advancedCount=0;
  progress.clear();
  db.values.toList().forEach((workout) {
    if(workout.isCompleted && workout.level == Levels.beginner && gender == workout.gender){
      beginnerCount+=1;
    }else if(workout.isCompleted && workout.level == Levels.intermediate && gender == workout.gender ){
      intermediateCount+=1;
    }else if(workout.isCompleted && workout.level == Levels.advanced && gender == workout.gender){
      advancedCount+=1;
    }
  });
  List<double> list = [beginnerCount,intermediateCount,advancedCount];
  progress=list;
}
double beginnerCount =0;
double intermediateCount =0;
double advancedCount =0;
List<double> progress = [];
class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar( backgroundColor: Colors.black,title: Text('WORKOUT ANALYSIS'),),
      body: Center(
        child: SizedBox(
            height: 500, child: MyBargraph(workoutsummary: progress)),
      ),
    );
  }
}

class IndividualBar {
  final int x;
  final double y;
  IndividualBar({required this.x, required this.y});
}

class Bardata {
  final double beginnerReport;
  final double intermediatereport;
  final double advancereport;

  Bardata(
      {required this.beginnerReport,
      required this.intermediatereport,
      required this.advancereport,});
  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: beginnerReport),
      IndividualBar(x: 1, y: intermediatereport),
      IndividualBar(x: 2, y: advancereport),
    ];
  }
}

class MyBargraph extends StatelessWidget {
  final List<double> workoutsummary;
  const MyBargraph({super.key, required this.workoutsummary});

  @override
  Widget build(BuildContext context) {
    Bardata myBardata = Bardata(
      beginnerReport: workoutsummary[0],
      intermediatereport: workoutsummary[1],
      advancereport: workoutsummary[2],
    );
    myBardata.initializeBarData();

    return BarChart(BarChartData(
      maxY: 15,
      minY: 0,
      titlesData: const FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles))),
      barGroups: myBardata.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.grey[400],
                    width: 70,
                    borderRadius: BorderRadius.circular(2))
              ]))
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'Beginner',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'Intermediate',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'Advanced',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

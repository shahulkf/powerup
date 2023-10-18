
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';


class StopWatch extends StatefulWidget {
   final int count;

  const StopWatch({
    Key? key,
    required this.count,
  }) : super(key: key);


  @override
  StopWatchState createState() => StopWatchState();

}

class StopWatchState extends State<StopWatch> {

  final CountdownController _controller=
       CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context,) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Start
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Text('Start',style: TextStyle(color: Colors.black)),
                onPressed: () {
                  _controller.start();
                },
              ),
              // Pause
              ElevatedButton(
                 style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Text('Pause',style: TextStyle(color: Colors.black)),
                onPressed: () {
                  _controller.pause();
                },
              ),
              // Resume
              ElevatedButton(
                 style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Text('Resume',style: TextStyle(color: Colors.black)),
                onPressed: () {
                  _controller.resume();
                },
              ),
              // Stop
              ElevatedButton(
                 style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Text('Restart',style: TextStyle(color: Colors.black)),
                onPressed: () {
                  _controller.restart();
                },
              ),
            ],
          ),
        ),
        Countdown(
          controller: _controller,
          seconds: widget.count,
          build: (_, double time) => Text(
            time.toString(),
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          interval: Duration(seconds: 1),
          onFinished: () {
            isTimerEnd.value=true;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Timer is done!'),
              ),
            );
          },
        ),
      ],
    );
  }
}
ValueNotifier<bool> isTimerEnd = ValueNotifier(false);
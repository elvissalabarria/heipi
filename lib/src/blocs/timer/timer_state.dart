// ignore_for_file: overridden_fields

part of 'timer_bloc.dart';

@immutable
abstract class TimerState {
  final int second;

  const TimerState(this.second);
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);
}

class SecondTimerState extends TimerState {
  @override
  final int second;
  const SecondTimerState(this.second) : super(second);
}

part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class DoSecondTimerEvent extends TimerEvent {
  final int seconds;
  DoSecondTimerEvent(this.seconds);
}

class TimerEventStarted extends TimerEvent {
  TimerEventStarted();
}

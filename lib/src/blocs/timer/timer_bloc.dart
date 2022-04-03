import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(const TimerInitial()) {
    on<DoSecondTimerEvent>((event, emit) {
      emit(SecondTimerState(event.seconds));
    });
    on<TimerEventStarted>((event, emit) {
      emit(const TimerInitial());
    });
  }
}

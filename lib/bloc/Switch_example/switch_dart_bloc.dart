import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_provider/bloc/Switch_example/switch_dart_event.dart';
import 'package:state_provider/bloc/Switch_example/switch_dart_state.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchStates>{
  SwitchBloc():super(SwitchStates()){
    on<EnableNotification>(_EnableNotification);
    on<ColorSwap>(_ColorSwap);
  }

  void _EnableNotification(EnableNotification events, Emitter<SwitchStates> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _ColorSwap(ColorSwap events, Emitter<SwitchStates> emit){
    emit(state.copyWith(slider: events.slider));
  }
}
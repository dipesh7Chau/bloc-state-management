import 'package:equatable/equatable.dart';

abstract class SwitchEvents{
  SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableNotification extends SwitchEvents{}

class ColorSwap extends SwitchEvents{
  double slider;
  ColorSwap({required this.slider});

  @override
  List<Object> get props => [slider];
}

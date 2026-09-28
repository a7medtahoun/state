part of 'tasbeh_cubit.dart';

@immutable
class TasbehState {
  final int count;
  final int round;
  final int tasbehIndex;

  TasbehState({
    this.count = 0,
    this.round = 0,
    this.tasbehIndex = 0,
  });
}

class TasbehInitial extends TasbehState {
  TasbehInitial() : super();
}
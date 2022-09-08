import 'package:equatable/equatable.dart';
import 'package:my_thoughts/models/my_thoughts_model.dart';

abstract class MyThoughtsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitMyThoughtsState extends MyThoughtsState {}

class FailureMyThoughtsState extends MyThoughtsState {
  final String error;

  FailureMyThoughtsState(this.error);
}

class AddThoughtsState extends MyThoughtsState {
  final MyThoughts myThoughts;
  AddThoughtsState(this.myThoughts);
}

class GetAllThoughtsState extends MyThoughtsState {
  final List<MyThoughts> myThoughts;
  GetAllThoughtsState(this.myThoughts);
}

class ToggleThoughtState extends MyThoughtsState {}

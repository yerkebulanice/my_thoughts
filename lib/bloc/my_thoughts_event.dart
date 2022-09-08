import 'package:equatable/equatable.dart';
import 'package:my_thoughts/models/my_thoughts_model.dart';

abstract class MyThoughtsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddThoughtEvent extends MyThoughtsEvent {
  final MyThoughts myThought;
  AddThoughtEvent(this.myThought);
}

class GetAllThoughtsEvent extends MyThoughtsEvent {}

class ToggleThoughtEvent extends MyThoughtsEvent {
  final String id;
  ToggleThoughtEvent(this.id);
}

import 'package:bloc/bloc.dart';
import 'package:my_thoughts/bloc/my_thoughts_event.dart';
import 'package:my_thoughts/bloc/my_thoughts_state.dart';
import 'package:my_thoughts/models/my_thoughts_model.dart';

class MyThoughtsRepository {
  List<MyThoughts> myThoughts = [];

  Future<void> getAllThoughts(GetAllThoughtsEvent event, Emitter<MyThoughtsState> emit) async {
    List<MyThoughts> doneThoughts = [];
    List<MyThoughts> notDoneThoughts = [];
    for (MyThoughts myThoughts in myThoughts) {
      if (myThoughts.isDone) {
        doneThoughts.add(myThoughts);
      } else {
        notDoneThoughts.add(myThoughts);
      }
    }
    myThoughts = [];
    myThoughts.addAll(doneThoughts);
    myThoughts.addAll(notDoneThoughts);
    emit(GetAllThoughtsState(myThoughts));
  }

  Future<void> addThought(AddThoughtEvent event, Emitter<MyThoughtsState> emit) async {
    myThoughts.add(event.myThought);
    emit(AddThoughtsState(event.myThought));
  }

  Future<void> toggleThought(ToggleThoughtEvent event, Emitter<MyThoughtsState> emit) async {
    for (MyThoughts myThought in myThoughts) {
      if (myThought.id == event.id) {
        myThought.isDone = !myThought.isDone;
      }
    }
    emit(ToggleThoughtState());
  }
}

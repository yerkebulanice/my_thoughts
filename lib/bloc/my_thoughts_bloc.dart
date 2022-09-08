import 'package:bloc/bloc.dart';

import '../repository/my_thoughts_repository.dart';
import 'my_thoughts_event.dart';
import 'my_thoughts_state.dart';

class MyThoughtsBloc extends Bloc<MyThoughtsEvent, MyThoughtsState> {
  final MyThoughtsRepository _myThoughtsRepository = MyThoughtsRepository();
  MyThoughtsBloc() : super(InitMyThoughtsState()) {
    on<AddThoughtEvent>(_myThoughtsRepository.addThought);
    on<ToggleThoughtEvent>(_myThoughtsRepository.toggleThought);
    on<GetAllThoughtsEvent>(_myThoughtsRepository.getAllThoughts);
  }
}

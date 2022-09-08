import 'package:flutter/material.dart';
import 'package:my_thoughts/bloc/my_thoughts_bloc.dart';
import 'package:my_thoughts/constants/app_colors.dart';
import 'package:my_thoughts/models/my_thoughts_model.dart';

import '../bloc/my_thoughts_event.dart';

class Item extends StatelessWidget {
  final MyThoughtsBloc myThoughtsBloc;
  final MyThoughts myThought;
  const Item({
    Key? key,
    required this.myThoughtsBloc,
    required this.myThought,
  }) : super(key: key);

  void toggleThought(String id) {
    myThoughtsBloc.add(ToggleThoughtEvent(id));
    myThoughtsBloc.add(GetAllThoughtsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: AppColors.dark, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.16),
          spreadRadius: 0.5,
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
      ]),
      child: Row(
        children: [
          Expanded(
            child: Text(
              myThought.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                decoration: myThought.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          Checkbox(
            checkColor: Colors.black,
            fillColor: MaterialStateProperty.all(Colors.white.withOpacity(0.7)),
            value: myThought.isDone,
            onChanged: (value) => toggleThought(myThought.id),
          ),
        ],
      ),
    );
  }
}

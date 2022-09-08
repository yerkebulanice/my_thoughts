import 'package:flutter/material.dart';
import 'package:my_thoughts/bloc/my_thoughts_bloc.dart';
import 'package:my_thoughts/bloc/my_thoughts_event.dart';
import 'package:my_thoughts/constants/app_colors.dart';
import 'package:my_thoughts/models/my_thoughts_model.dart';

class Header extends StatelessWidget {
  final MyThoughtsBloc myThoughtsBloc;
  final TextEditingController controller;
  const Header({Key? key, required this.myThoughtsBloc, required this.controller})
      : super(key: key);

  void onAddThought(BuildContext context) {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please, type text!'),
        backgroundColor: Colors.red,
      ));
      return;
    }
    MyThoughts myThought = MyThoughts(name: controller.text);
    myThoughtsBloc.add(AddThoughtEvent(myThought));
    myThoughtsBloc.add(GetAllThoughtsEvent());
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            cursorColor: AppColors.grey,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              hintText: 'Type text ....',
              hintStyle: TextStyle(color: Colors.white, fontSize: 14.0),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
        const SizedBox(width: 13.0),
        IconButton(
          onPressed: () => onAddThought(context),
          icon: const Icon(Icons.add, size: 30, color: AppColors.grey),
        ),
      ],
    );
  }
}

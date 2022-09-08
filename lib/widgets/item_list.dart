import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_thoughts/bloc/my_thoughts_bloc.dart';
import 'package:my_thoughts/bloc/my_thoughts_event.dart';
import 'package:my_thoughts/bloc/my_thoughts_state.dart';
import 'package:my_thoughts/widgets/item.dart';

class ItemList extends StatelessWidget {
  final MyThoughtsBloc myThoughtsBloc;
  const ItemList({Key? key, required this.myThoughtsBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: myThoughtsBloc,
      builder: (context, state) {
        if (state is GetAllThoughtsState) {
          return ListView.separated(
            primary: false,
            shrinkWrap: true,
            reverse: true,
            itemCount: state.myThoughts.length,
            itemBuilder: (context, index) => Item(
              myThoughtsBloc: myThoughtsBloc,
              myThought: state.myThoughts[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 13.0),
          );
        }
        return Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_thoughts/bloc/my_thoughts_bloc.dart';
import 'package:my_thoughts/bloc/my_thoughts_event.dart';
import 'package:my_thoughts/constants/app_colors.dart';
import 'package:my_thoughts/widgets/header.dart';
import 'package:my_thoughts/widgets/item_list.dart';

void main() {
  runApp(BlocProvider(create: (context) => MyThoughtsBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.focusedChild?.unfocus();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my_thoughts',
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MyThoughtsBloc myThoughtsBloc;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    myThoughtsBloc = MyThoughtsBloc();
    myThoughtsBloc.add(GetAllThoughtsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 21.0),
          child: Column(
            children: [
              Header(myThoughtsBloc: myThoughtsBloc, controller: textController),
              const SizedBox(height: 14.0),
              ItemList(myThoughtsBloc: myThoughtsBloc),
            ],
          ),
        ),
      ),
    );
  }
}

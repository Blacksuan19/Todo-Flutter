import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/all.dart';
import 'models/todo.dart';
import 'theme.dart';
import 'widgets/floating_button.dart';
import 'widgets/todo_item.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gotta Do It!',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: AppTheme.primaryColor,
          accentColor: AppTheme.accentColor),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gotta Do It!"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          widthFactor: 1,
          child: Column(
            children: [
              ...todoItems.map((item) {
                return BuildTodoItem(
                  item: item,
                  cont: context,
                );
              }).toList(),
            ],
          ),
        ),
        color: ThemeColors.backgroundColor,
      ),
      floatingActionButton: BuildFloatingButton(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      Fluttertoast.showToast(
        msg: "Selected Index: " + _controller.index.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(
                    16) //                 <--- border radius here
            ),
          ),
          child: TabBar(
            controller: _controller,
            labelColor: Colors.white,
            indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)), // Creates border
                color: Colors.blue),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                text: 'DASHBOARD',
              ),
              Tab(
                  child: Text(
                    "BATTING & FIELDING",
                    textAlign: TextAlign.center,
                  )),
              Tab(
                text: 'BOWLING',
              ),
            ],
          ),
        ));
  }
}

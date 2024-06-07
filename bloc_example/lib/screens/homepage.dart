import 'package:bloc_example/screens/streamDataTab.dart';
import 'package:bloc_example/screens/triggerLogicTab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            child: TabBarView(
              children:
              [
                //TabView 1
                streamDataTab(),

                //TabView 2
                TriggerLogicTab(),
              ],
            ),
          ),

          bottomNavigationBar: Container(
            child: TabBar(
              tabs:
              [
                //tab1
                Tab(
                  child: Text('Stream \nJust Data.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                ),

                //tab2
                Tab(
                  child: Text('Trigger \nLogic/Function.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                ),
              ],
              indicatorColor: Colors.transparent,
            ),
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            ),
          ),
        )
    );
  }
}

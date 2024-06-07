import 'dart:async';

import 'package:bloc_example/event.dart';

late String myName;
late String myImagePath;


void switchIdentity(t) {
  //This the Function that is needed to be triggered.
  if (myName == 'Jenil') {
    myName = 'JD';
    myImagePath = 'assets/img1.jpg';
  } else {
    myName = 'Jenil';
    myImagePath = 'assets/img2.jpg';
  }
}

class TriggerLogicBloc {

  var _triggerLogicController = StreamController<Event>();

  Function(Event) get sinkTriggerLogic => _triggerLogicController.sink.add;
  Stream<Event> get streamTriggerLogic => _triggerLogicController.stream;

  TriggerLogicBloc() {
    streamTriggerLogic.listen(switchIdentity);
  }

  dispose() {
    _triggerLogicController?.close();
  }
}

TriggerLogicBloc triggerLogicBloc = TriggerLogicBloc();
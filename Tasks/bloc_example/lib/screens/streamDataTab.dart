import 'package:bloc_example/bloc/justDataBloc.dart';
import 'package:flutter/material.dart';

import '../ui/imageCard.dart';

class streamDataTab extends StatefulWidget {
  const streamDataTab({super.key});

  @override
  State<streamDataTab> createState() => _streamDataTabState();
}

//tab 1

class _streamDataTabState extends State<streamDataTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        children:
        [
          SizedBox(height: 20),
          Expanded(
              child: Stack(
                alignment: Alignment.center,
                children:
                [
                  imageCard('assets/img1.jpg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('Hi!\nMy Name is..\nWhat?\nMy Name is..\nWho?\nMy Name is..', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white,),
                          textAlign: TextAlign.center),
                      SizedBox(height: 15),

                      StreamBuilder(
                        initialData: '...',
                        stream: justDataBloc.streamJustData,
                        builder: (BuildContext context, AsyncSnapshot snapshot)
                        {
                          return Text(snapshot.data, style: TextStyle
                              (
                                fontWeight: FontWeight.bold,
                                fontSize: 38,
                                color: Colors.white,
                              ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              )
          ),

          SizedBox(height: 10),

          Row(
            children:
            [
              Expanded(child: MaterialButton(onPressed: () {
                    justDataBloc.feedJustData('Slim Shady');
                  },child: Text('Tell Them', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
              ),

              SizedBox(height: 10),

              InkWell(
                onTap: (){
                  setState(() {
                    justDataBloc.feedJustData('...');
                  });
                },

                child: Container(child: Icon(Icons.loop,size: 25,color: Colors.white),
                height: 50,width: 50,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

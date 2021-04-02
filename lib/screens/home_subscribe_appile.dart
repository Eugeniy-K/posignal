
import 'package:posignal/widgets/item_chat.dart';
import 'package:flutter/material.dart';

class HomeSubscribeAppile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        automaticallyImplyLeading: false,
        title: FlatButton(
          onPressed: () {
            // _controllerNum.clear();
          },
          padding: EdgeInsets.all(0.0),
          child: Text.rich(
              TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Posignal', style: TextStyle(
                        fontSize: 35, color: Colors.white,
                        fontFamily: 'CenturyGothic')),
                    TextSpan(text: "'", style: TextStyle(
                        fontSize: 35, color: Colors.red,
                        fontFamily: 'CenturyGothic'
                    ))
                  ]
              )
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, size: 35,),
            color: Colors.white,
            itemBuilder: (BuildContext bc) => [
              // PopupMenuItem(child: Text(offNotif), textStyle: TextStyle(
              //     color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
              // ), value: 'value'),
              // PopupMenuItem(child: Text(offSoundNotif), textStyle: TextStyle(
              //     color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
              // ),value: 'value'),
            ],
            onSelected: (value) {
              print(value);
            },),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              // constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(                                                          //табы
                color: Colors.black12,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Подписки', style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'CenturyGothic',
                        ),),
                        SizedBox(width: 7,),                                        //Новые сообщения
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 20,
                          child: Text('2'),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(3.0))
                          ),
                        )
                      ],
                    ),),
                    Tab(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Подписки', style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'CenturyGothic',
                        ),),
                        SizedBox(width: 7,),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 20,
                          child: Text('2'),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(3.0))
                          ),
                        )
                      ],
                    ),)
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(children: [
                    ItemChat(colorBlack: true, number: 'f476jf',
                      region: '174', newMessages: 2,),
                    ItemChat(colorBlack: false, number: 'f476jf',
                        region: '174', ),
                    ItemChat(colorBlack: true, number: 'f476jf',
                        region: '174', newMessages: 5,),
                    ItemChat(colorBlack: false, number: 'f476jf',
                        region: '174', newMessages: 1,),
                    ItemChat(colorBlack: true, number: 'f476jf',
                        region: '174',)],),
                  Center(child: Text('CATS')),
                ],
              ),
            ),
          ],
        ),
      )

    );
  }
}


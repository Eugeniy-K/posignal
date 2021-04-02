import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_page.dart';

class DialogChatSreen extends StatefulWidget {
  final String title;
  final String number;
  final String region;

  const DialogChatSreen({Key key, this.title, this.number, this.region}) : super(key: key);
  @override
  _DialogChatSreenState createState() => _DialogChatSreenState();
}

class _DialogChatSreenState extends State<DialogChatSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(widget.title == null ? 'Без названия' : widget.title,
                style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 24
                ),),
            ),
            SizedBox(width: 20,),
            Container(                                                                //Основа знака
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white,
              ),
              width: 150,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(width: 3)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(                                                 //Поле с номером
                        widget.number == null ? "А 000 АА" : widget.number.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          color: Colors.black,
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(                                                        //контейнер с регионом
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(width: 2))
                      ),
                      child: Column(
                        children: [
                          // SizedBox(height: 3,),
                          Expanded(
                              child: Text(                                       //Поле региона
                                widget.region == null ? "00" : widget.region,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Row(
                            children: [
                              SizedBox(width: 1,),
                              Text("RUS",                                                   //RUS
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    fontFamily: 'CenturyGothic'),),
                              SizedBox(width: 2,),
                              Container(
                                width: 12,
                                height: 10,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1)),
                                child: Column(                                              //Флаг
                                  children: [
                                    Container(width: 12, height: 2,),
                                    Container(width: 12, height: 3, color: Colors.blue[900],),
                                    Container(width: 12, height: 3, color: Colors.redAccent[700],)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, size: 35,),
            color: Colors.white,
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text(main), textStyle: TextStyle(
                  color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
              ), value: main),
              PopupMenuItem(child: Text(unsubscribe), textStyle: TextStyle(
                  color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
              ),value: unsubscribe),
              PopupMenuItem(child: Text(rename), textStyle: TextStyle(
                  color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
              ),value: rename),
              PopupMenuItem(child: Text(removeChat), textStyle: TextStyle(
                  color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
              ),value: removeChat),
            ],
            onSelected: (value) {
              onClickAppbarButton(value);
            },),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Center(child: Text('Сообщений пока нет'))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0, bottom: 13.0),
                          border: InputBorder.none,
                          hintText: 'Введите текст',
                          hintStyle: TextStyle(
                            fontFamily: 'CenturyGothic',
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: () {},
                      // onTap: message.trim().isEmpty ? null : sendMessage,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(6.0))
                        ),
                        child: Icon(Icons.arrow_forward, size: 57,),
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onClickAppbarButton(value) {
    switch(value) {
      case main: Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
    }
  }
}

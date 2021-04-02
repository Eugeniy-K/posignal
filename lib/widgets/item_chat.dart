import 'package:flutter/material.dart';

class ItemChat extends StatelessWidget {

  // final bool newMessage;
  final int newMessages;
  final String number;
  final String region;
  final bool colorBlack;
  const ItemChat({
    Key key, @required this.colorBlack, @required this.number,
    @required this.region, this.newMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBlack ? Colors.grey[900] : Colors.black12,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text('Name of cubscribe lnflds',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CenturyGothic'
              ),),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(                                                                //Основа знака
                  padding: EdgeInsets.all(2.0),
                  // margin: EdgeInsets.symmetric(vertical: 5.0),
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
                            number == null ? "А 000 АА" : number.toUpperCase(),
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
                                    region == null ? "00" : region,
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
          ),
          newMessages != null ? Expanded(
              flex: 1,
              child: Container(                                             //новые сообщения
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10),
                width: 30,
                height: 30,
                child: Text("$newMessages"),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(3.0))
                ),
              )) : SizedBox(width: 0,),
        ],
      ),
    );
  }
}
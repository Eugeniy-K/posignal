import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posignal/constants.dart';
import 'package:posignal/number_storage.dart';
import 'package:posignal/screens/dialog_appile_screen.dart';
import 'package:posignal/screens/dialog_chat_screen.dart';
import 'package:posignal/screens/home_subscribe_appile.dart';

class HomePage extends StatefulWidget {
  NumberStorage storage;
  @override
  _HomePageState createState() => _HomePageState();

  HomePage({@required this.storage});
}

class _HomePageState extends State<HomePage> {

  bool _fileExists;
  String _numberText;
  var _controllerNum = TextEditingController();
  var _controllerRegion = TextEditingController();
  var _controllerInstruction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlatButton(                                                          // кнопка-логотип
          onPressed: () {
            _controllerNum.clear();
            _controllerRegion.clear();
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
                PopupMenuItem(child: Text(offNotif), textStyle: TextStyle(
                  color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
                ), value: 'value'),
                PopupMenuItem(child: Text(offSoundNotif), textStyle: TextStyle(
                  color: Colors.black, fontFamily: 'CenturyGothic', fontSize: 20
                ),value: 'value'),
              ],
          onSelected: (value) {
                print(value);
          },),
        ],
        actionsIconTheme: IconThemeData(size: 30,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Container(                                                                //Основа знака
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      width: 350,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(width: 5)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(                                                 //Поле с номером
                                textAlign: TextAlign.center,
                                controller: _controllerNum,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                onChanged: (text) {
                                  _numberText = _controllerNum.text + _controllerRegion.text;
                                  _checkFile();
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50.0,
                                  ),
                                  hintText: 'А 000 АА',
                                ),
                              ),
                            ),
                            Container(                                                        //контейнер с регионом
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(left: BorderSide(width: 3))
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 15,),
                                  Expanded(
                                      child: TextField(
                                        onChanged: (text) {
                                          _numberText = _controllerNum.text + _controllerRegion.text;
                                          _checkFile();
                                        },//Поле ввода региона
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        controller: _controllerRegion,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40.0,
                                          ),
                                          hintText: '00',
                                        ),
                                      )),
                                  Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Text("RUS",                                                   //RUS
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25.0,
                                            fontFamily: 'CenturyGothic'),),
                                      SizedBox(width: 8,),
                                      Container(
                                        width: 30,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1)),
                                        child: Column(                                              //Флаг
                                          children: [
                                            Container(width: 30, height: 6,),
                                            Container(width: 30, height: 6, color: Colors.blue[900],),
                                            Container(width: 30, height: 6, color: Colors.redAccent[700],)
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
                    SizedBox(height: 15,),
                    TextButton(                                                      //кнопка Подписаться
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 15.0)
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black)
                        ),
                        onPressed: () {
                          _subscribe();
                        },
                        child: Text(_fileExists == false ? "ПОДПИСАТЬСЯ" : "ОТПИCАТЬСЯ",
                          style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 30,
                          ) ,
                        )),
                    SizedBox(height: 2,),
                    TextButton(                                                       //кнопка Написать
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 15.0)
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black)
                        ),
                        onPressed: () {
                          if (_numberText != '') {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DialogAppileScreen(
                                    title: "qwertyasdfghjkkl",
                                    number: "м697ху",
                                  );
                                }));
                          }
                        },
                        child: Text("НАПИСАТЬ",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 30,
                          ) ,
                        )),
                    SizedBox(height: 2,),
                    TextButton(                                                         //кнопка Войти
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 15.0)
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black)
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return HomeSubscribeAppile();
                              }));
                        },
                        child: Text("ВОЙТИ",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 30,
                          ) ,
                        )),
                  ],
                ),
              ),
              Expanded(                                                                 // инструкция
                child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 10.0),
                    child: TextField(
                      maxLines: 15,
                      onChanged: (value) {
                        print(_controllerInstruction.text);
                      },
                      controller: _controllerInstruction,
                      decoration: InputDecoration(border: InputBorder.none),
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 25,
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _subscribe() async {
    if (_fileExists == false) {
      final file = await widget.storage.createFile(_numberText);
      bool check = await widget.storage.checkFile(_numberText);
      print(file);
      setState(() {
        _fileExists = check;
      });
    } else {
      await widget.storage.deleteFile(_numberText);
      bool check = await widget.storage.checkFile(_numberText);
      setState(() {
        _fileExists = check;
      });
    }
  }

  _checkFile() async {
    _fileExists = await widget.storage.checkFile(_numberText);
    setState(() {});
  }

  @override
  void initState() {
    _fileExists = false;
    _numberText = '';
    _controllerInstruction.text = instruction;
  }
}

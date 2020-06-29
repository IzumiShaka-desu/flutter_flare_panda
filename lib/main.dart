import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:login/components.dart';
import 'package:login/panda_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PandaController _pandaController;
  final TextEditingController _textController1 = TextEditingController(),
      _textController2 = TextEditingController();
  String cht;
  @override
  void initState() {
    cht = "welcome to my App,please login to continue";
    _pandaController = PandaController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height,
        deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(children: [
        Positioned(
            top: deviceHeight / 7,
            left: deviceWidth / 4,
            child: Container(
                width: deviceWidth / 2,
                height: deviceWidth / 2,
                alignment: Alignment.topCenter,
                child: FlareActor(
                  "assets/panpan.flr",
                  fit: BoxFit.contain,
                  controller: _pandaController,
                ))),

        Positioned(
          left: deviceWidth / 14,
          top: (deviceHeight / 7 + deviceWidth / 2) - 10,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            width: (deviceWidth / 14) * 12,
            height: deviceHeight / 3,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Center(
                    child: Container(
                        width: (deviceWidth / 14) * 11,
                        child: TextFormField(
                            key: _formKey,
                            onChanged: (val) {
                              if (!val.contains('@')) {
                                _pandaController.smile(false);
                                setState(() {
                                  cht = "hmmm.. i don't see a valid email";
                                });
                              } else if (!val.split('@')[1].contains('.')) {
                                _pandaController.smile(false);
                                setState(() {
                                  cht = "hmmm.. i don't see a valid email";
                                });
                              } else {
                                setState(() {
                                  _pandaController.smile(true);
                                  cht ="welcome to my App,please login to continue";
                                });
                              }
                            },
                            onTap: () => _pandaController.coverEyes(false),
                            controller: _textController1,
                            decoration: InputDecoration(
                                hintText: "please input a valid mail",
                                labelText: "Email"))),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Center(
                    child: Container(
                        width: (deviceWidth / 14) * 11,
                        child: TextFormField(
                            controller: _textController2,
                            onTap: () => _pandaController.coverEyes(true),
                            onChanged: (str) =>
                                _pandaController.coverEyes(true),
                            onEditingComplete: () =>
                                _pandaController.coverEyes(false),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "please input password",
                                labelText: "Password"))),
                  )
                ],
              ),
              SizedBox(height: 15),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(25)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _pandaController.coverEyes(false);
                        if (_textController2.text == "password") {
                          _pandaController.smile(true);
                          setState(() {
                            cht = "login successfull!";
                          });
                        } else {
                          _pandaController.smile(false);
                          setState(() {
                            cht = "please check your password and try again!";
                          });
                        }
                      },
                      child: Center(
                        child: Text("Log in"),
                      ),
                    ),
                  ))
            ]),
          ),
        ),
        Positioned(
            top: (deviceHeight / 20) * 6,
            left: deviceWidth / 8,
            child: Chat(
              text: cht,
              width: (deviceWidth / 8) * 6,
              height: 45,
            )),
      ]),
    );
  }
}

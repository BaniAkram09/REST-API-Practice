// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, avoid_print
//import 'package:firstapp/assignment.dart';
import 'dart:convert';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/junk/category_practice.dart';
import 'package:firstapp/login_ui.dart';
import 'package:firstapp/models/results.dart' as user;
import 'package:firstapp/screens/authenticate/sign_in.dart';
import 'package:firstapp/screens/wrapper.dart';
import 'package:firstapp/services/auth.dart';
import 'package:firstapp/signup_ui.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:dio/dio.dart';

void main() async {
  String key = 'k_6su0029c';
  BaseOptions options = BaseOptions(
      baseUrl: "https://imdb-api.com/API/AdvancedSearch/k_6su0029c?",
      connectTimeout: 5000);
  Dio dio = Dio(options);

  try {
    List<user.Result> list = [];
    Response resp = await dio.get(
      "?title_type=feature,tv_movie&release_date=2020-01-01,2022-01-01&countries=pk",
      queryParameters: {"apiKey": "k_6su0029c"},
    );
    for (var item in resp.data["results"]) {
      list.add(user.Result.fromJSON(item));
    }
    for (int i = 0; i < 10; i++) {
      print(list[i].title);
    }
    // print("Response:");
    // print("Status:\n${resp.statusCode}");
    // print("Header:\n${resp.headers}");
    // print("Data:\n${resp.data}");

  } catch (e) {
    print("Exception: $e");
  }
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container();
    // return StreamProvider<User?>.value(
    //   catchError: (_, __) {},
    //   value: AuthService().user,
    //   initialData: null,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(primarySwatch: Colors.blue),
    //     home: ResponsiveSizer(
    //       builder: (context, orientation, screenType) {
    //         return const Loginui();
    //         // return Wrapper();
    //       },
    //     ),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String firstNum = '';

  int secondNum = 0;
  String result = '';
  bool op = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 10.h,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(
              height: 55.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      simpleButton('C', operator2: true, op: true),
                      simpleButton('+/-', operator2: true, op: true),
                      simpleButton('%', operator2: true, op: true),
                      simpleButton('/', operator1: true, op: true),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      simpleButton('7'),
                      simpleButton('8'),
                      simpleButton('9'),
                      simpleButton('x', operator1: true, op: true),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      simpleButton('4'),
                      simpleButton('5'),
                      simpleButton('6'),
                      simpleButton('-', operator1: true, op: true),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      simpleButton('1'),
                      simpleButton('2'),
                      simpleButton('3'),
                      simpleButton('+', operator1: true, op: true),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() {
                            if (controller.text != '') {
                              controller.text = controller.text + '0';
                            } else {
                              controller.text = '';
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Container(
                            height: 10.h,
                            width: 46.w,
                            child: Center(
                              child: Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 25.sp),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              shape: BoxShape.rectangle,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                      simpleButton('.', op: true),
                      simpleButton('=', operator1: true, op: true),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget simpleButton(String num,
      {bool operator1 = false, bool operator2 = false, op}) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          if (op == true) {
            if (firstNum == '' || num == 'C') {
              controller.text = '';
              return;
            } else {
              switch (num) {
                case '%':
                  controller.text = controller.text + num;
                  result = num;
                  break;
                case '+':
                  controller.text = controller.text + num;
                  result = num;
                  break;
                case '-':
                  controller.text = controller.text + num;
                  result = num;
                  break;
                case 'x':
                  controller.text = controller.text + num;
                  result = num;
                  break;
                case '/':
                  controller.text = controller.text + num;
                  result = num;
                  break;
                case '.':
                  controller.text = controller.text + num;
                  result = num;
                  break;
                case '=':
                  firstNum = controller.text;
                  firstNum = firstNum.replaceAll('x', '*');
                  try {
                    Parser p = Parser();
                    Expression exp = p.parse(firstNum);

                    ContextModel cm = ContextModel();
                    result = '${exp.evaluate(EvaluationType.REAL, cm)}';
                    controller.text = result;
                  } catch (e) {
                    result = "Error";
                  }
                  // if (result != '') {
                  //   switch (result) {
                  //     case '+':
                  //       controller.text = (firstNum + secondNum).toString();
                  //       firstNum = int.parse(controller.text);
                  //       secondNum = 0;
                  //       result = '';
                  //       break;
                  //   }
                  // }
                  break;
              }
              return;
            }
          } else {
            if (firstNum != '' && result != '')
              controller.text = controller.text + num;
            firstNum = controller.text;
            return;
          }
        },
        child: Container(
          child: Center(
            child: Text(
              num,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: operator2 ? Colors.black : Colors.white,
                fontSize: 25.sp,
              ),
            ),
          ),
          height: 10.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: operator1
                ? Colors.orange
                : operator2
                    ? Colors.grey[500]
                    : Colors.grey[800],
          ),
        ),
      ),
    );
  }
}

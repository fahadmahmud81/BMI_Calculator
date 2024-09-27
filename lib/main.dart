import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//helllo
class _HomeScreenState extends State<HomeScreen> {

  TextEditingController ageController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController wtController = TextEditingController();

  double? ans = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {

            setState(() {
              ageController.clear();
              ftController.clear();
              inchController.clear();
              wtController.clear();
              ans=0;
            });




          }, icon: Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                    controller: ageController,

                    labelText: 'Age',
                  ),
                  CustomInputField(
                    controller: ftController,
                    labelText: 'Ht(f)',
                  ),
                  CustomInputField(
                    controller: inchController,
                    labelText: 'Ht(in)',
                  ),
                ],
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.male,
                        size: 30,
                      )),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.female,
                        size: 30,
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 60,
                    child: CustomInputField(

                      controller: wtController,

                      labelText: 'Weight',
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 95,
                    child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          double? ft = double.tryParse(ftController.text)??0;
                          double? inch = double.tryParse(inchController.text)??0;
                          double? wt = double.tryParse(wtController.text)??0;
                          double? meter = (ft * 12 + inch) * 0.0254;
                          ans = wt / (meter*meter);

                          setState(() {

                          });



                        },
                      child: Text(
                        'Result',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: 300,

                child: SfRadialGauge(

                    axes: <RadialAxis>[
                      RadialAxis(minimum: 15, maximum: 40, ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 18,
                            color: Colors.yellow,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 18,
                            endValue: 25,
                            color: Colors.green,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 25,
                            endValue: 40,
                            color: Colors.red,
                            startWidth: 10,
                            endWidth: 10)
                      ], pointers: <GaugePointer>[
                        NeedlePointer(value: ans?.toDouble()??0)
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child:  Text(ans?.toStringAsFixed(1) ?? '0',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 0.5)
                      ])
                    ]),

              ),



          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Very Severely Underweight',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) <= 15.9 ? Colors.green : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '<- 15.9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) <= 15.9
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Severely Underweight',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                            (ans?.toDouble() ?? 0) <= 16.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '16.0 - 16.9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                            (ans?.toDouble() ?? 0) <= 16.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Underweight',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                            (ans?.toDouble() ?? 0) <= 18.4)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '17.0 - 18.4',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                            (ans?.toDouble() ?? 0) <= 18.4)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Normal',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                            (ans?.toDouble() ?? 0) <= 24.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '18.5 - 24.9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                            (ans?.toDouble() ?? 0) <= 24.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overweight',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                            (ans?.toDouble() ?? 0) <= 29.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '25.0 - 29.9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                            (ans?.toDouble() ?? 0) <= 29.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Obese Class |',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                            (ans?.toDouble() ?? 0) <= 34.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '30.0 - 34.9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                            (ans?.toDouble() ?? 0) <= 34.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Obese Class ||',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 35.0 &&
                            (ans?.toDouble() ?? 0) <= 39.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '35.0 - 39.9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ((ans?.toDouble() ?? 0) >= 35.0 &&
                            (ans?.toDouble() ?? 0) <= 39.9)
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Obese Class |||',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) >= 45.0
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  ),
                  Text(
                    '>= 45.0',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (ans?.toDouble() ?? 0) >= 45.0
                            ? Colors.green
                            : Colors.black,
                        letterSpacing: 0.4
                    ),
                  )
                ],
              ),
            ],
          ),
              SizedBox(height: 5,),
              Text("Normal Weight: 117.9 - 159.4 lb", style: TextStyle(color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }




}

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomInputField({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<CounterScreen>{

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:RichText(
          text: const TextSpan(
            children: [
              TextSpan(text:'Counter App', style: TextStyle(fontSize:25, color: Colors.white,)),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Count:',style: TextStyle(fontSize: 28,),),
            Text(counter.toString(),style: const TextStyle(fontSize: 60,fontWeight: FontWeight.bold,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  counter = counter + 1;
                  if(counter >=5 ){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Button pressed $counter times'),
                            actions: [
                              TextButton(onPressed: () {Navigator.pop(context);},child: const Text('Close')),
                            ],
                          );
                        });
                  }
                  setState(() {});
                },
                    child: const Text('  +  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.white,
                  margin: const EdgeInsets.all(8), //outside
                  padding: const EdgeInsets.all(8), //inside
                  alignment: Alignment.center,
                  child: const Text('Hello'),
                ),
                ElevatedButton(onPressed: (){
                  counter = counter - 1;
                  if(counter <=0 ){
                    counter = 0;
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Alert!'),
                            content: const Text('Counter can not be less than zero.'),
                            actions: [
                              TextButton(onPressed: () {Navigator.pop(context);},child: const Text('Close')),
                            ],
                          );
                        });
                  }
                  setState(() {});
                },
                    child: const Text('   -  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

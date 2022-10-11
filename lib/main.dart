
import 'package:api_practice/prayer_show.dart';
import 'package:api_practice/remote.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Post.dart';
extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0}) {
    return this.replacing(hour: this.hour + hour, minute: this.minute + minute);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Prayer? prayers;
   var isl = false;
   late TimeOfDay _startTime;
   late String time ;
    Color c = Colors.black;


  @override

  void initState() {
    // TODO: implement initState

    super.initState();
    getdata();
    time = TimeOfDay.now().toString();



   // hj = prayers!.data.date.hijri.year + " " + prayers!.data.date.hijri.month.ar + " " + prayers!.data.date.hijri.day + " " + prayers!.data.date.hijri.weekday.ar ;
  }

  getdata() async
  {
    prayers = (await RemoteS().getP())!;
    if (prayers != null) {
      setState(() {
        isl = true;
         _startTime = TimeOfDay(hour:int.parse(prayers!.data.timings.fajr.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).add(hour: 1);
       // _startTime.add(hour: 1);
        print (_startTime);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(

            centerTitle: true,

            title: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
              Icon(Icons.menu,

              size: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All prayers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("Tunis", style: TextStyle(fontSize: 12,color: Colors.white),),
                  ],
                ),



                Icon(Icons.settings,

                  size: 30,),


          ]),
            backgroundColor: Color (0xFF116e11),
            elevation: 0,

          ),

          body: ListView.builder(

              physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                   children: [
                     Container(
                       color: Color (0xFF116e11),  //Color (0xFF01281a) ,
                       height: 150,
                       width: MediaQuery.of(context).size.width,
                       child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,


                           children: [
                             Text(time, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFe5fbe5)),),
                             Text("Tunis", style: TextStyle(fontSize: 24, color: Colors.white),),
                           ],
                         ),
                       ),
                     ),

                     Container(
                       color: Color (0xFF01281a) ,
                       height: 60,
                       width: MediaQuery.of(context).size.width,
                       child: Center(
                         child: Row(
                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
                             //mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.arrow_left,

                               size: 30,),

                             Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [

                               Row(children : [
                                 Text(prayers!.data.date.gregorian.weekday.en , style: TextStyle(fontSize: 15, color: Colors.white),),
                                 Text(" ", style: TextStyle(fontSize: 15, color: Colors.white),),
                                 Text(prayers!.data.date.readable , style: TextStyle(fontSize: 15, color: Colors.white),),

                               ],),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                 children : [
                                   Text(prayers!.data.date.hijri.year, style: TextStyle(fontSize: 15, color: Colors.white),),
                                   Text(" ", style: TextStyle(fontSize: 15, color: Colors.white),),
                                   Text(prayers!.data.date.hijri.month.ar , style: TextStyle(fontSize: 15, color: Colors.white),),
                                   Text("  ", style: TextStyle(fontSize: 15, color: Colors.white),),
                                   Text(prayers!.data.date.hijri.day , style: TextStyle(fontSize: 15, color: Colors.white),),
                                   Text(" ", style: TextStyle(fontSize: 15, color: Colors.white),),
                                   Text(prayers!.data.date.hijri.weekday.ar , style: TextStyle(fontSize: 15, color: Colors.white),),





                               ],),
                             ],
                           ),
                             Icon(Icons.arrow_right,

                               size: 30,),],

                         ),
                       ),
                     ),

                     InkWell(
                       onTap: ()  {
                         setState(() {
                            time = TimeOfDay(hour:int.parse(prayers!.data.timings.fajr.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).format(context);
                            print(time);
                         });
                       },
                         child: PryS(prayername: "الفجر ", prayertime: prayers!.data.timings.fajr, c :c )
                     ),
                     InkWell(
                         onTap: ()  {
                           setState(() {
                             time = TimeOfDay(hour:int.parse(prayers!.data.timings.sunrise.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).format(context);
                             print(time);
                           });
                         },
                         child: PryS(prayername: "الشروق", prayertime: prayers!.data.timings.sunrise,c :c)),
                     InkWell(
                         onTap: ()  {
                           setState(() {
                             time = TimeOfDay(hour:int.parse(prayers!.data.timings.dhuhr.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).format(context);
                             print(time);
                           });
                         },
                         child: PryS(prayername: "الظهر", prayertime: prayers!.data.timings.dhuhr,c :c)),
                     InkWell(
                         onTap: ()  {
                           setState(() {
                             time = TimeOfDay(hour:int.parse(prayers!.data.timings.asr.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).format(context);
                             print(time);
                           });
                         },
                         child: PryS(prayername: "العصر", prayertime: prayers!.data.timings.asr,c :c)),
                     InkWell(
                         onTap: ()  {
                           setState(() {
                             time = TimeOfDay(hour:int.parse(prayers!.data.timings.maghrib.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).format(context);
                             print(time);
                           });
                         },
                         child: PryS(prayername: "المغرب", prayertime: prayers!.data.timings.maghrib,c :c)),
                     InkWell(
                         onTap: ()  {
                           setState(() {
                             time = TimeOfDay(hour:int.parse(prayers!.data.timings.isha.split(":")[0]),minute: int.parse(prayers!.data.timings.fajr.split(":")[1])).format(context);
                             print(time);
                           });
                         },
                         child: PryS(prayername: "العشاء ", prayertime: prayers!.data.timings.isha,c :c)),





                   ],

                );


              }
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor:Color (0xFF01281a) ,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Prayer Time',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.campaign, color: Colors.white,),
                label: 'Qibla',

                backgroundColor: Colors.white,

              ),
            ],
          ),
        )
    );
  }


}

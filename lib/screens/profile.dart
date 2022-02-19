import 'dart:math';

import 'package:cis_task_1/constants.dart';
import 'package:cis_task_1/shared/reusabe_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Status{active,inactive}

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  List<Widget>timeDataBuilder=[];
  void getTime(){
    for(int i =0;i<time.length;i++){
      String currentTime=time[i];
      Widget newItem= buildPickTimeCard(numberColor: kPrimaryColor,
          containerColor:Colors.white,
          context: context,
        time:currentTime
      );
      timeDataBuilder.add(newItem);
    }
  }
  int currentIndex=0;

  void selectItem(index){
    setState(() {
      currentIndex=index;
    });
  }
  //Status selected=Status.inactive;
  // List<int>dayNumber=[0,1,2,3,4,5,6,7,8,9];
  List<String>time=
  [
    '7:30 AM',
    '8:30 AM',
    '9:30 AM',
    '10:30 AM',
    '11:30 AM',
    '12:30 AM',
    '7:30 PM',
    '8:30 PM',
    '9:30 PM',
    '10:30 PM',
    '11:30 PM',
    '12:30 PM',];
  String pickedTime;
  bool activeColor = true;
  @override
  Widget build(BuildContext context) {
   pickedTime=time[0];
    return Scaffold(
      backgroundColor: Color(0xffE2E2E2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Stack(
             alignment: AlignmentDirectional.bottomEnd,
             children: [ Container(
               padding: EdgeInsets.all(20),
               decoration: BoxDecoration(
                   color: Color(0xff154762),
                   borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(35),
                       bottomRight: Radius.circular(35))),
               height: MediaQuery.of(context).size.height / 3 - 20,
               child: Column(
                 children: [
                   Row(
                     children: [
                       GestureDetector(
                           onTap: () => Navigator.pop(context),
                           child: Icon(
                             Icons.arrow_back,
                             size: 28,
                           )),
                       Expanded(child: SizedBox()),
                       Stack(
                         alignment: AlignmentDirectional.topEnd,
                         children: [
                           Icon(
                             Icons.alarm_add,
                             size: 28,
                           ),
                           Positioned(
                               child: CircleAvatar(
                                 radius: 5,
                                 backgroundColor: Colors.green,
                               ))
                         ],
                       )
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     children: [
                       Container(
                         width: 85,
                         height: 105,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/d0.jpg'),
                                 fit: BoxFit.fill),
                             borderRadius: BorderRadius.circular(5)),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Dr. Fred Mask',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             'Heart Surgeon',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 14,
                                 fontWeight: FontWeight.w500),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(right: 8.0),
                                 child: Icon(
                                   Icons.star,
                                   color: Color(0xffD7A712),
                                   size: 20,
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 8.0),
                                 child: Icon(
                                   Icons.star,
                                   color: Color(0xffD7A712),
                                   size: 20,
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 8.0),
                                 child: Icon(
                                   Icons.star,
                                   color: Color(0xffD7A712),
                                   size: 20,
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 8.0),
                                 child: Icon(
                                   Icons.star,
                                   color: Color(0xffD7A712),
                                   size: 20,
                                 ),
                               ),
                             ],
                           )
                         ],
                       )
                     ],
                   ),

                 ],
               ),
             ),
               Positioned(
                 top: MediaQuery.of(context).size.height/4-20,
                 child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Container(
                     width: 45,
                     height: 50,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)),
                     child: Material(
                       borderRadius: BorderRadius.circular(10),
                       elevation: 5,
                       child: Center(
                         child: Icon(
                           Icons.location_on,
                           size: 30,
                           color: Colors.yellow,
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     width: 20,
                   ),
                 ],
               ),)
             ],
           ),
            SizedBox(height: 20,),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'April 2020',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                                selectItem(index);
                            },
                            child: buildPickDayCard(
                                containerColor:currentIndex==index
                                    ? kContainerActiveColor
                                    : kContainerInactiveColor,
                                dayColor: currentIndex==index
                                    ? kDayActiveColor
                                    : kDayInactiveColor,
                                numberColor: currentIndex==index
                                    ? kNumberActiveColor
                                    : kNumberInactiveColor,
                                containerNumberColor: currentIndex==index
                                    ? kContainerNumberActiveColor
                                    : kContainerNumberInactiveColor)
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Morning',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[0],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[1],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[2],containerColor:Colors.white ,context: context),
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[3],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[4],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[5],containerColor:Colors.white ,context: context),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Evening',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[6],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[7],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[8],containerColor:Colors.white ,context: context),
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[9],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[10],containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, time: time[11],containerColor:Colors.white ,context: context),
                        ],
                      ),

                    ],
                  ),
                  Container(

                    height: MediaQuery.of(context).size.height/20+20,
                    width: double.infinity,

                    margin: EdgeInsets.only(right: 30,top: 20,left: 10,),
                    decoration: BoxDecoration(
                      color: kContainerActiveColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text('Make An Appointment',style:  TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),),),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

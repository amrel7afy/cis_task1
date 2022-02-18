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
  @override
  Widget build(BuildContext context) {
    int currentIndex=0;

    void selectItem(index){
      setState(() {
        currentIndex=index;
      });
    }

    //Status selected=Status.inactive;
    // List<int>dayNumber=[0,1,2,3,4,5,6,7,8,9];
     List<String>time=[
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
       '12:30 PM',
     ];
     String pickedTime=time[0];
    bool activeColor = true;
    return Scaffold(
      backgroundColor: Color(0xffE2E2E2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Heart Surgeon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
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
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          child: Center(
                            child: Icon(
                              Icons.location_on,
                              size: 10,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
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
                                setState(() {

                                });
                            },
                            child: buildPickDayCard(
                                containerColor:currentIndex==index
                                    ? kContainerActiveColor
                                    : kContainerInactiveColor,
                                dayColor: currentIndex==index
                                    ? kDayActiveColor
                                    : kDayInactiveColor,
                                numberColor: activeColor == true
                                    ? kNumberActiveColor
                                    : kNumberInactiveColor,
                                containerNumberColor: activeColor == true
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
                          buildPickTimeCard(numberColor: kPrimaryColor, containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, containerColor:Colors.white ,context: context),
                          buildPickTimeCard(numberColor: kPrimaryColor, containerColor:Colors.white ,context: context),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // buildPickTimeCard(context),
                          // buildPickTimeCard(context),
                          // buildPickTimeCard(context),
                        ],
                      ),
                    ],
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

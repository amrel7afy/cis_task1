

import 'package:cis_task_1/model.dart';
import 'package:cis_task_1/screens/profile.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

Widget buildCategoryCard(
    {@required int catIconIndex,
    @required String categoryName,
    @required String doctorsNumber}) {
  return Container(
    width: 100,
    height: 130,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff196E5D),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/${catIconIndex}.png'))),
          ),
          Text(
            categoryName,
            style: TextStyle(
                color: Color(0xffD6ffff),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xff468C81)),
            child: Center(
              child: Text(
                '${doctorsNumber} Doctors',
                style: TextStyle(
                    color: Color(0xffD6ffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildTopRateCard(DocModel doctorList, context) {
  return GestureDetector(
    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfile())),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
      width: double.infinity,
      margin: EdgeInsets.only(left: 5, right: 30),
      child: Material(
        elevation: 2,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/d${doctorList.id}.jpg'),
                      fit: BoxFit.fill)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: Text(
                      doctorList.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    doctorList.specialization,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.star,
                        color: Color(0xffD7A712),
                        size: 20,
                      ),
                      Text('4.7'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.location_on_rounded,
                          color: Color(0xffD7A712), size: 20),
                      Text('20 km'),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget buildPickDayCard(
{
  @required Color containerColor,
  @required Color dayColor,
  @required Color numberColor,
  @required Color containerNumberColor
}
    ){
  return Container(width: 65,
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Mon',
          style: TextStyle(
              color:dayColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color:containerNumberColor ,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            '21',
            style: TextStyle(
                color: numberColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox()
      ],
    ),

  );
}


Widget buildPickTimeCard({
  context,
  @required Color numberColor,
  @required Color containerColor,
  @required String time

})
{
  return Container(
    height: MediaQuery.of(context).size.height/20,
    decoration: BoxDecoration(
       color: containerColor,
      borderRadius: BorderRadius.circular(8)
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(Icons.alarm,color:numberColor,
          ),
        ),Padding(
          padding: const EdgeInsets.all(5),
          child: Text(time,style: TextStyle(color:kNumberInactiveColor
              ,fontSize: 16,fontWeight: FontWeight.w600),),
        )
      ],
    ),
  );
}

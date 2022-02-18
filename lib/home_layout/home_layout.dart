import 'package:cis_task_1/constants.dart';
import 'package:cis_task_1/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/reusabe_components.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<DocModel> doctors = [
      DocModel(id: 0, name: 'Fred Mask', specialization: 'Heart Surgeon'),
      DocModel(id: 1, name: 'Stella Kane', specialization: 'Bone Specialist'),
      DocModel(id: 2, name: 'Zac Wolff', specialization: 'Eye Specialist'),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: Icon(
                    Icons.notifications_none,
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.iYpFSu2O2kVP1OptEdJ-uwHaHx?pid=ImgDet&rs=1'),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffD6D6D6),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                padding: EdgeInsets.only(
                  left: 20,
                  top: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //HI, Olivia
                          Text(
                            'Hi, Olivia',
                            style: TextStyle(
                                color: Color(0xff48484A),
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //Welcome Back
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
//0xffEBEBEB
                          //textFormField
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 25, 0),
                            child: Material(
                              elevation: 10,
                              color: Color(0xffEBEBEB),
                              borderRadius: BorderRadius.circular(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Search...',
                                  suffixIcon: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xff1C7363)),
                                      child: Icon(
                                        Icons.search,
                                        size: 28,
                                        color: Color(0xffD6D6D6),
                                      )),
                                  hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Category',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                      color: Color(0xff808082),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //Category Cards
                          Container(
                              width: double.infinity,
                              height: 130,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  List<String> catName = [
                                    'Dental',
                                    'Heart',
                                    'Brain',
                                    'Eye'
                                  ];
                                  List<String> docNumber = [
                                    '14',
                                    '18',
                                    '20',
                                    '16'
                                  ];
                                  return buildCategoryCard(
                                      catIconIndex: index,
                                      categoryName: catName[index],
                                      doctorsNumber: docNumber[index]);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 22,
                                ),
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            'Top rate',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Color(0xff808082),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ListView.separated
                              (itemBuilder: (context,index){
                              return buildTopRateCard(doctors[index],context);
                            }, separatorBuilder: (context,index)=>SizedBox(
                              height: 10,
                            ),
                                itemCount: doctors.length,
                             physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

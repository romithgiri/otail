import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otail/controllers/statewise_controller.dart';
import 'package:otail/values/Size.dart' as cf;

class IndiaStateWise extends StatelessWidget {
  final indiaSateWiseController = Get.put(SateWiseDataController());

  List<Color> colorList = [Colors.indigoAccent, Colors.green, Colors.orange];

  List<Color> colorList2 = [
    Colors.blue,
    Colors.lightGreen,
    Colors.deepOrange,
  ];

  void init() {
    print("####################### 1:");
    indiaSateWiseController.apiOperation(ApiAction.getData);
  }

  @override
  Widget build(BuildContext context) {
    cf.Size.init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: cf.Size.screenWidth,
            height: cf.Size.screenHeight,
            color: Colors.yellow,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text(
                      "Click Me to get data from API",
                      textAlign: TextAlign.center,
                    ),
                    width: cf.Size.screenWidth,
                    height: cf.Size.screenHeight / 15,
                  ),
                  onTap: () {
                    indiaSateWiseController.apiOperation(ApiAction.getData);
                  },
                ),
                GetX<SateWiseDataController>(builder: (controller) {
                  return indiaSateWiseController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : getListView(controller.dataFromServer);
                })
              ],
            )),
      ),
    );
  }

  /*indiaSateWiseController.dataFromServer == null ?
            Text(
              "Loading",
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
            )
                :
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("kjsdvdsjkfvdslvndslv")
                )
            )*/
  /*Container(
  child: indiaSateWiseController.dataFromServer == null ?
  Text(
  "Loading",
  style: TextStyle(fontSize: 12),
  )
      :
  Expanded(
  child: Padding(
  padding: EdgeInsets.only(left: 5, right: 5),
  child: Text("kjsdvdsjkfvdslvndslv")
  ))
  );
  */
  Widget getListView(List filterData) {
    var listItems = filterData;
    var listview = ListView.builder(
        itemCount: filterData.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 15,
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                listItems[index].state,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.pinkAccent[700],
                                    fontSize: cf.Size.blockSizeHorizontal * 4.5,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Last updated time : ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              cf.Size.blockSizeHorizontal * 3.9,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Text(
                                      listItems[index]
                                          .lastupdatedtime
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              cf.Size.blockSizeHorizontal * 3.9,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w200),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Colors.green,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Active Case :',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                cf.Size.blockSizeHorizontal *
                                                    3.9,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        listItems[index].active.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                cf.Size.blockSizeHorizontal *
                                                    3.9,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                )),
                            horizontalScrolCard(
                              context,
                              'Total Confirmed',
                              'Total Recovered',
                              'Total Deaths',
                              colorList,
                              listItems[index].confirmed,
                              listItems[index].recovered,
                              listItems[index].deaths,
                            ),
                            horizontalScrolCard(
                              context,
                              'Recent Confirmed',
                              'Recent Recovered',
                              'Recent Deaths',
                              colorList2,
                              listItems[index].deltaconfirmed,
                              listItems[index].deltarecovered,
                              listItems[index].deltadeaths,
                            )
                          ],
                        ))),
              ),
            ],
          );
        });
    return listview;
  }

  Widget horizontalScrolCard(BuildContext context, strConfirmed, strRecovered,
      strDeaths, colorList, valConfirmed, valRecovered, valDeaths) {
    cf.Size.init(context);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        height: cf.Size.screenHeight / 6,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            child:
                countryCard(context, colorList[0], strConfirmed, valConfirmed),
          ),
          Container(
            child:
                countryCard(context, colorList[1], strRecovered, valRecovered),
          ),
          Container(
            child: countryCard(context, colorList[2], strDeaths, valDeaths),
          )
        ]));
  }

  Widget countryCard(BuildContext context, colorList, strTitle, valData) {
    // TODO: implement build
    cf.Size.init(context);
    return Container(
        width: cf.Size.screenWidth / 3.4,
        child: Align(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Container(
                  height: cf.Size.screenHeight / 12.5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0, top: 5.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          strTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: cf.Size.blockSizeHorizontal * 3.7,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200),
                        )),
                  )),
              Container(
                width: cf.Size.screenWidth / 4,
                height: cf.Size.screenHeight / 15,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        valData,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: cf.Size.blockSizeHorizontal * 3.9,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w200),
                      )),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: colorList,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ])));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roomcontrol/data_model/data_model.dart';
import 'package:roomcontrol/screens/room.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreenStateful();
  }
}

class HomeScreenStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreenStateful> {

  List<HomeItemsDm> _homeItems;
  double gridSize;

  @override
  void initState() {
    super.initState();
    _homeItems = new List();
    _homeItems.add(new HomeItemsDm(AssetImage("assets/bed.png"), "Bed room", 4));
    _homeItems.add(new HomeItemsDm(AssetImage("assets/room.png"), "Living room", 2));
    _homeItems.add(new HomeItemsDm(AssetImage("assets/kitchen.png"), "Kitchen", 5));
    _homeItems.add(new HomeItemsDm(AssetImage("assets/bathtube.png"), "Bathroom", 1));
    _homeItems.add(new HomeItemsDm(AssetImage("assets/house.png"), "Outdoor", 5));
    _homeItems.add(new HomeItemsDm(AssetImage("assets/balcony.png"), "Balcony", 2));
  }

  @override
  Widget build(BuildContext context) {
    if(gridSize == null) {
      gridSize = ((MediaQuery.of(context).size.width * .30) /
          (MediaQuery.of(context).size.height * .13));
    }
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Color(0xff09495C),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
            )
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              alignment: AlignmentDirectional.topEnd,
              child: Image(
                image: AssetImage("assets/bubble_bg.png"),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: AlignmentDirectional.bottomStart,
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.04,
                                bottom: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Control\nPanel",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "QuicksandBold",
                                          fontSize: MediaQuery.of(context).size.width * 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/user.png",
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                                    topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                                  ),
                                  color: Color(0xffF6F8FB)
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[

                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      top: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Text(
                                      "All Rooms",
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontFamily: "QuicksandBold",
                                        fontSize: MediaQuery.of(context).size.width * 0.045,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: GridView.builder(
                                        gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: gridSize,
                                        ),
                                        itemBuilder: (context, position) {
                                          return _buildItems(_homeItems[position]);
                                        },
                                        itemCount: _homeItems.length,
                                        scrollDirection: Axis.vertical,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                        top: MediaQuery.of(context).size.width * 0.03,
                        bottom: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {

                            },
                            child: Image(
                              image: AssetImage("assets/bulb.png"),
                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Image(
                              image: AssetImage("assets/Icon_home.png"),
                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Image(
                              image: AssetImage("assets/icon_settings.png"),
                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems(HomeItemsDm data) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height * 0.03)),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoomScreen()));
        },
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          alignment: AlignmentDirectional.centerStart,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Image(
                  image: data.image,
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Text(
                  "${data.title}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "QuicksandBold",
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.01,
                  left: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Text(
                  "${data.noOfBulb} Lights",
                  style: TextStyle(
                    color: Colors.orange[400],
                    fontFamily: "QuicksandBold",
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
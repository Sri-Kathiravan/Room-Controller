import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roomcontrol/data_model/index.dart';

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoomScreenStateful();
  }
}

class RoomScreenStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RoomScreenState();
  }
}

class RoomScreenState extends State<RoomScreenStateful> {

  List<LightDm> _lights;
  int _selectedLightIndex;
  ColorDM _selectedColor;
  double _intensityLevel;
  List<ColorDM> _colors;
  List<SceneDm> _scenes;
  double gridSize;

  @override
  void initState() {
    super.initState();

    _lights = new List();
    _lights.add(new LightDm("Main Light", AssetImage("assets/main_light_color.png"), AssetImage("assets/main_light_white.png")));
    _lights.add(new LightDm("Desk Light", AssetImage("assets/furniture_white.png"), AssetImage("assets/furniture_white.png")));
    _lights.add(new LightDm("Bed Light", AssetImage("assets/bed_color.png"), AssetImage("assets/bed_color.png")));

    _selectedLightIndex = 1;
    _selectedColor = new ColorDM(Colors.yellow, [Colors.yellow[100], Colors.yellow[400], Colors.yellow[600], Colors.yellow[800], Colors.yellow[900]]);
    _intensityLevel = 0;

    _colors = new List();
    _colors.add(new ColorDM(Colors.red, [Colors.red[100], Colors.red[400], Colors.red[600], Colors.red[800], Colors.red[900]]));
    _colors.add(new ColorDM(Colors.green, [Colors.green[100], Colors.green[400], Colors.green[600], Colors.green[800], Colors.green[900]]));
    _colors.add(new ColorDM(Colors.blue, [Colors.blue[100], Colors.blue[400], Colors.blue[600], Colors.blue[800], Colors.blue[900]]));
    _colors.add(new ColorDM(Colors.deepPurple, [Colors.deepPurple[100], Colors.deepPurple[400], Colors.deepPurple[600], Colors.deepPurple[800], Colors.deepPurple[900]]));
    _colors.add(new ColorDM(Colors.purple, [Colors.purple[100], Colors.purple[400], Colors.purple[600], Colors.purple[800], Colors.purple[900]]));
    _colors.add(new ColorDM(Colors.yellow, [Colors.yellow[100], Colors.yellow[400], Colors.yellow[600], Colors.yellow[800], Colors.yellow[900]]));

    _scenes = new List();
    _scenes.add(new SceneDm("Birthday", Colors.red[600], Colors.red[300]));
    _scenes.add(new SceneDm("Party", Colors.deepPurple[600], Colors.deepPurple[300]));
    _scenes.add(new SceneDm("Relax", Colors.blue[600], Colors.blue[300]));
    _scenes.add(new SceneDm("Fun", Colors.green[600], Colors.green[300]));
  }

  @override
  Widget build(BuildContext context) {

    if(gridSize == null) {
      gridSize = ((MediaQuery.of(context).size.width * .20) /
          (MediaQuery.of(context).size.height * .04));
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
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.08),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      child: Icon(
                                                        Icons.arrow_back,
                                                        color: Colors.white,
                                                        size: MediaQuery.of(context).size.width * 0.06,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                      child: Text(
                                                        "Bed",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "QuicksandBold",
                                                          fontSize: MediaQuery.of(context).size.width * 0.06,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: AlignmentDirectional.topStart,
                                              child: Text(
                                                "Room",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "QuicksandBold",
                                                  fontSize: MediaQuery.of(context).size.width * 0.06,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: AlignmentDirectional.topStart,
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context).size.width * 0.03,
                                              ),
                                              child: Text(
                                                "4 Lights",
                                                style: TextStyle(
                                                  color: Colors.yellow[600],
                                                  fontFamily: "QuicksandBold",
                                                  fontSize: MediaQuery.of(context).size.width * 0.04,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Container(
                                                alignment: AlignmentDirectional.center,
                                                height: MediaQuery.of(context).size.width * 0.2,
                                                width: MediaQuery.of(context).size.width * 0.02,
                                                color: Colors.white,
                                              ),
                                              Container(
                                                alignment: AlignmentDirectional.center,
                                                height: MediaQuery.of(context).size.width * 0.15,
                                                width: MediaQuery.of(context).size.width * 0.35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(MediaQuery.of(context).size.width * 0.1),
                                                    topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
                                                    bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.02),
                                                    bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.02),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                alignment: AlignmentDirectional.center,
                                                height: MediaQuery.of(context).size.width * 0.06,
                                                width: MediaQuery.of(context).size.width * 0.12,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(10000),
                                                    bottomRight: Radius.circular(10000),
                                                  ),
                                                  color: _getColorShade(_selectedColor, _intensityLevel),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Container(
                                        height: MediaQuery.of(context).size.width * 0.1,
                                        child: ListView.builder(
                                          itemBuilder: (context, position) {
                                            return _buildLightItems(_lights[position], position);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _lights.length,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
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
                                      "Intensity",
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontFamily: "QuicksandBold",
                                        fontSize: MediaQuery.of(context).size.width * 0.045,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      right: MediaQuery.of(context).size.width * 0.05,
                                      top: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: MediaQuery.of(context).size.width * 0.02,
                                          ),
                                          child: Image(
                                            image: AssetImage("assets/intensity_low.png"),
                                            width: MediaQuery.of(context).size.width * 0.08,
                                          ),
                                        ),
                                        Expanded(
                                          child: Slider(
                                              value: _intensityLevel,
                                              min: 0,
                                              max: 4,
                                              activeColor: _selectedColor.mainColor,
                                              divisions: 5,
                                              onChanged: (_newValue) {
                                                setState(() {
                                                  _intensityLevel = _newValue;
                                                });
                                              }
                                              ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.width * 0.02,
                                          ),
                                          child: Image(
                                            image: AssetImage("assets/intensity_full.png"),
                                            width: MediaQuery.of(context).size.width * 0.08,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      top: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Text(
                                      "Colors",
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontFamily: "QuicksandBold",
                                        fontSize: MediaQuery.of(context).size.width * 0.045,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      top: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    height: MediaQuery.of(context).size.width * 0.1,
                                    child: Container(
                                      child: ListView.builder(
                                        itemBuilder: (context, position) {
                                          if(position == _colors.length) {
                                            return _buildColorAddButton();
                                          } else {
                                            return _buildColorItems(_colors[position], position);
                                          }
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _colors.length + 1,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      top: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Text(
                                      "Scenes",
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
                                          return _buildSceneItems(_scenes[position]);
                                        },
                                        itemCount: _scenes.length,
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

  Widget _buildSceneItems(SceneDm data) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width * 0.02)),
          gradient: LinearGradient(
              colors: [
                data.startColor,
                data.endColor,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight
          )
      ),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.center,
                child: Image(
                  image: AssetImage("assets/light.png"),
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Text(
                  "${data.title}",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "QuicksandBold",
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLightItems(LightDm light, int position) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLightIndex = position;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width * 0.03)),
          color: (_selectedLightIndex == position) ? Colors.cyan : Colors.white
        ),
        child: Container(
          margin: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.02
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(image: (_selectedLightIndex == position) ? light.selectedImage : light.image),
              Container(
                child: Text(
                  "   ${light.title}",
                  style: TextStyle(
                    color: (_selectedLightIndex == position) ? Colors.white : Colors.cyan,
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

  Widget _buildColorItems(ColorDM color, int position) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: color.mainColor,
        ),
        child: Container(
        ),
      ),
    );
  }

  Widget _buildColorAddButton() {
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: Colors.white,
        ),
        child: Container(
          alignment: AlignmentDirectional.center,
          height: MediaQuery.of(context).size.width * 0.05,
          width: MediaQuery.of(context).size.width * 0.05,
          child: Icon(
            Icons.add,
            size: MediaQuery.of(context).size.width * 0.03,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Color _getColorShade(ColorDM color, double intensity) {
    int newIntensity = intensity.round();
    return color.shades[newIntensity];
  }

}
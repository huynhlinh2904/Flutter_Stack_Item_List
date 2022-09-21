import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _value = 'Đại Học FPT';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.amber,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 30,
            ),
           SizedBox(width: 20),
           DropdownButton<String>(
               value: _value ,
               icon: const Icon(Icons.arrow_forward_ios_rounded),
               items: const <DropdownMenuItem<String>>[
                 DropdownMenuItem(
                     child: Text('Đại Học FPT'),
                 value: 'Đại Học FPT',
                 ),
                 DropdownMenuItem(
                   child: Text('Đại Học HUTECH'),
                   value: 'Đại Học HUTECH',
                 ),
               ],
             onChanged: (String? newValue){
               setState((){
                 _value = newValue!;
               });
             },
               ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_alert_outlined, color: Colors.black,),
            onPressed: (){
            },
          ),
          // iconButton for andrew
          IconButton(
            icon: Icon(Icons.dehaze, color: Colors.black,),
            onPressed: (){
              _openEndDrawer();
            },
          )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ), child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('item 1'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('item 2'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 5,),
              Container(
                color: Colors.amber,
                height: mqHeight / 3,
                child: Stack(
                   children: <Widget>[
                    Column(
                      children: [
                        SizedBox(height: 30,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: const <Widget>[
                               Text(
                                'Chào, MinhT',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'AirbnbCerealBold',
                                ),
                              ),
                               SizedBox(height: 10,),
                               Text(
                                'Bạn muốn ăn gì?',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    Positioned(
                      top: mqHeight / 5.5,
                      left:0.0,
                      right:0.0,
                      bottom:0.0,
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 100,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.white10, width: 1
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 20,
                                  child: Icon(Icons.card_giftcard)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                  child: Column(
                    children: [
                       ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height:mqHeight / 1.9,
                            width: double.infinity,
                                child: Column(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.white10, width: 1
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      clipBehavior: Clip.none,
                                      elevation: 20,
                                      child: SizedBox(
                                        height: 350,
                                        width: 300,
                                        child: Column(
                                          children: [
                                            Image.asset('assets/images/anh_1.png'),
                                            Text('data'),
                                            Text('data'),
                                          ],
                                        ),
                                      ),
                                      color: Colors.white,
                                    )
                                  ],
                                ),//),
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
      ),
    );
  }
}

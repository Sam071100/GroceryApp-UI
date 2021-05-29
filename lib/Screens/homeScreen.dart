import 'package:flutter/material.dart';
import 'package:grocery_cart/Screens/cart_Screen.dart';

import 'item_screen.dart';

// ignore: camel_case_types
class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class Photo {
  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;

  Photo({this.assetName, this.assetPackage, this.title, this.caption});
}

// ignore: camel_case_types
class _home_screenState extends State<home_screen> {
  List list = ['12', '11'];

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'images/veg.jpg',
      title: 'Fruits & Vegetables',
    ),
    Photo(
      assetName: 'images/frozen.jpg',
      title: 'Frozen Veg',
    ),
    Photo(
      assetName: 'images/bev.jpg',
      title: 'Beverages',
    ),
    Photo(
      assetName: 'images/brand_f.jpg',
      title: 'Branded Food',
    ),
    Photo(
      assetName: 'images/be.jpg',
      title: 'Beauty and Personal Care',
    ),
    Photo(
      assetName: 'images/home.jpg',
      title: 'Home care and Fashion',
    ),
    Photo(
      assetName: 'images/nonveg.jpg',
      title: 'Non-Veg',
    ),
    Photo(
      assetName: 'images/eggs.jpg',
      title: 'Dairy, Bakery & Eggs',
    ),
  ];
  String name = 'My Wishlist';

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Grocery Store"),
        actions: <Widget>[
          IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                // Event calling goes here
              }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cart_screen()));
                      },
                    ),
                    list.length == 0
                        ? Container()
                        : Positioned(
                            child: Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.brightness_1,
                                  size: 20.0,
                                  color: Colors.orange.shade500,
                                ),
                                Positioned(
                                  top: 4.0,
                                  right: 5.5,
                                  child: Center(
                                    child: Text(
                                      list.length.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Card(
              child: UserAccountsDrawerHeader(
                accountName: Text('Shubham Samrat'),
                accountEmail: Text('shubham.samrat@iitbhu.ac.in'),
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.difference,
                  color: Colors.white30,
                  image: DecorationImage(
                    image: ExactAssetImage('images/gro.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: ExactAssetImage('images/sam.jpg'),
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.favorite_outlined),
                    title: Text(name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => item_screen(
                                    toolbarname: name,
                                  )));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.history_rounded),
                    title: Text("Order History"),
                    onTap: () {},
                  )
                ],
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                    onTap: () {},
                  )
                ],
              ),
            ),
            Card(
              elevation: 4.0,
              child: ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.redAccent, fontSize: 17.0),
                ),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Should you encounter any bugs, glitches, lack of functionality, delayed deliveries, billing errors or other problems on the beta website, please email us on sam@iitbhu.ac.in\n',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/ios.jpg'),
                      Image.asset('images/play.jpg'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _verticalID(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => item_screen(
                                    toolbarname: 'Fruits & Vegetables',
                                  )));
                    },
                    child: Text(
                      'Best Value',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalID(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => item_screen(
                                    toolbarname: 'Fruits & Vegetables',
                                  )));
                    },
                    child: Text(
                      'Top Sellers',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _verticalID(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => item_screen(
                                        toolbarname: 'Fruits & Vegetables',
                                      )));
                        },
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _verticalID(),
                      IconButton(
                        onPressed: () {},
                        icon: keyloch,
                        color: Colors.black26,
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: 188.0,
                margin: EdgeInsets.only(left: 5.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 270.0,
                        child: Card(
                          shape: shapeBorder,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 180.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                        child: Image.asset('images/grthre.jpg',
                                            fit: BoxFit.cover))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 270.0,
                        child: Card(
                          shape: shapeBorder,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 180.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Image.asset(
                                        'images/grtwo.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              )
                              /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                            ],
                          ),
                        ),
                        // description and share/explore buttons
                        // share, explore buttons
                      ),
                    ),
                    SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 270.0,

                        child: Card(
                          shape: shapeBorder,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 180.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Image.asset(
                                        'images/groceries.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              )

                              /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                            ],
                          ),
                        ),
                        // description and share/explore buttons
                        // share, explore buttons
                      ),
                    ),
                    SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 270.0,

                        child: Card(
                          shape: shapeBorder,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 180.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Image.asset(
                                        'images/back.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              )

                              /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                            ],
                          ),
                        ),
                        // description and share/explore buttons
                        // share, explore buttons
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _verticalID(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => item_screen(
                                      toolbarname: 'Fruits & Vegetables',
                                    )));
                      },
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalID(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => item_screen(
                                      toolbarname: 'Fruits & Vegetables',
                                    )));
                      },
                      child: Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalID(),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => item_screen(
                                          toolbarname: 'Fruits & Vegetables',
                                        )));
                          },
                          child: Text(
                            'Whats ',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 700.0,
                child: GridView.builder(
                  itemCount: photos.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => item_screen(
                                      toolbarname: 'Fruits & Vegetables',
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Card(
                          shape: shapeBorder,
                          elevation: 3.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 152.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        child: Image.asset(
                                          photos[index].assetName,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 3.0, bottom: 3.0),
                                        alignment: Alignment.bottomLeft,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        item_screen(
                                                          toolbarname:
                                                              'Fruits & Vegetables',
                                                        )));
                                          },
                                          child: Text(
                                            photos[index].title,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Icon keyloch = Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );
}

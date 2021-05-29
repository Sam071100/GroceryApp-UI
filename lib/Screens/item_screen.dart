import 'package:flutter/material.dart';
import 'package:grocery_cart/Screens/cart_Screen.dart';
import 'package:grocery_cart/items/item_details.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as _RangeSlider;

// ignore: camel_case_types
class item_screen extends StatefulWidget {
  final String toolbarname;

  item_screen({Key key, this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _item_screenState(toolbarname);
}

class Item {
  final String itemname;
  final String imagename;
  final String itmprice;
  final int price;

  Item({this.itemname, this.imagename, this.itmprice, this.price});
}

// ignore: camel_case_types
class _item_screenState extends State<item_screen> {
  _item_screenState(String toolbarname);

  List list = ['12', '11'];
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  VoidCallback _showBottomSheetCallback;
  // List of objects
  List<Item> itemList = <Item>[
    Item(
        imagename: 'images/apple.jpg',
        itemname: 'Apple',
        itmprice: '₹.150 per kg',
        price: 150),
    Item(
        imagename: 'images/tomato.jpg',
        itemname: 'Tomato',
        itmprice: '₹.15 per kg',
        price: 15),
    Item(
        imagename: 'images/lemons.jpg',
        itemname: 'Lemon',
        itmprice: '₹.5 per Pc',
        price: 5),
    Item(
        imagename: 'images/kiwi.jpg',
        itemname: 'Kiwi Fruit',
        itmprice: '₹.15 per Pc',
        price: 15),
    Item(
        imagename: 'images/guava.jpg',
        itemname: 'Guava',
        itmprice: '₹.50 per kg',
        price: 50),
    Item(
        imagename: 'images/grapes.jpg',
        itemname: 'Grapes',
        itmprice: '₹.75 per kg',
        price: 75),
    Item(
        imagename: 'images/pineapple.jpg',
        itemname: 'Pineapple',
        itmprice: '₹.65 per Pc',
        price: 65),
    Item(
        imagename: 'images/apple.jpg',
        itemname: 'Apple',
        itmprice: '₹.150 per kg',
        price: 150),
  ];
  void sortbyPrice() {
    itemList.sort((a, b) => a.price.compareTo(b.price));
  }

  String toolbarname = 'Fruits & Vegetables';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
        case TargetPlatform.linux:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case TargetPlatform.macOS:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case TargetPlatform.windows:
          // ignore: todo
          // TODO: Handle this case.
          break;
      }
      assert(false);
      return null;
    }

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(_backIcon()),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(toolbarname),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context, delegate: null,
                // delegate: _delegate,
              );
            },
          ),
          IconButton(
              tooltip: 'Sort',
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                _showBottomSheet(); // Function of Filters and Sorting
              }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: GestureDetector(
                onTap: () {
                  /*Navigator.of(context).push(
                   MaterialPageRoute(
                      builder:(BuildContext context) =>
                       CartItemsScreen()
                  )
              );*/
                },
                child: Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart_screen()));
                        }),
                    list.length == 0
                        ? Container()
                        : Positioned(
                            child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange.shade500),
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
                                  )),
                            ],
                          )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            // height: 500.0,
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(4.0),
                children: itemList.map((Item photo) {
                  return TravelDestinationItem(
                    destination: photo,
                  ); // Uss page ka layout is method mai hai
                }).toList(),
              ),
            ),
          )
        ],
      ),

      /* return  GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 360.0,
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Container(
                         child: SizedBox(
                        height: 184.0,
                           child:Image.asset(
                                    itemList[index].imagename,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                          ),
                           Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(itemList[index].itemname,style: TextStyle(color: Colors.black87,fontSize: 17.0,fontWeight: FontWeight.bold),),
                                Text(itemList[index].itemname,style: TextStyle(color: Colors.black38,fontSize: 17.0),)
                              ],
                            ),
                          )
                          // description and share/explore buttons
                        ],
                      ),
                    ),
                  ),
                );*/
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );

  bool a = true;
  String mText = "Press to hide";
  double _lowerValue = 1.0;
  double _upperValue = 100.0;

  void _visibilitymethod() {
    setState(() {
      if (a) {
        a = false;
        mText = "Press to show";
      } else {
        a = true;
        mText = "Press to hide";
      }
    });
  }

  List<RangeSliderData> rangeSliders;
  List<Widget> _buildRangeSliders() {
    List<Widget> children = <Widget>[];
    for (int index = 0; index < rangeSliders.length; index++) {
      children
          .add(rangeSliders[index].build(context, (double lower, double upper) {
        // adapt the RangeSlider lowerValue and upperValue
        setState(() {
          rangeSliders[index].lowerValue = lower;
          rangeSliders[index].upperValue = upper;
        });
      }));
      // Add an extra padding at the bottom of each RangeSlider
      children.add(SizedBox(height: 8.0));
    }

    return children;
  }

  void _showBottomSheet() {
    setState(() {
      // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<Null>((BuildContext context) {
          final ThemeData themeData = Theme.of(context);
          return Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: themeData.disabledColor))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    'FILTER/SORTING',
                    style: TextStyle(fontSize: 12.0, color: Colors.black26),
                  ),
                  _verticalD(),
                  OutlineButton(
                      borderSide: BorderSide(color: Colors.amber.shade500),
                      child: const Text('CLEAR'),
                      textColor: Colors.amber.shade500,
                      onPressed: () {
                        // Clear the selected Filter chip
                      },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  _verticalD(),
                  OutlineButton(
                      borderSide: BorderSide(color: Colors.amber.shade500),
                      child: const Text('APPLY'),
                      textColor: Colors.amber.shade500,
                      onPressed: () {
                        // Apply the following Filters
                      },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ],
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              )),
              Container(
                  height: 400.0,
                  margin: EdgeInsets.only(left: 7.0, top: 5.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _titleContainer("Sort"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Wrap(
                                spacing: 5.0,
                                runSpacing: 3.0,
                                children: <Widget>[
                                  filterChipWidget(
                                      chipName: 'Lowest Price First'),
                                  filterChipWidget(
                                      chipName: 'Highest Price First'),
                                  filterChipWidget(
                                      chipName: 'Alphabetical Order'),
                                  filterChipWidget(
                                      chipName: 'Popular Price First'),
                                  filterChipWidget(
                                      chipName: 'Best Price First'),
                                  filterChipWidget(
                                      chipName: 'Most Rated First'),
                                ],
                              )),
                            ),
                          ),
                          Divider(
                            color: Colors.blueGrey,
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _titleContainer('Filter'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Wrap(
                                  spacing: 5.0,
                                  runSpacing: 5.0,
                                  children: <Widget>[
                                    filterChipWidget(chipName: 'Fruits'),
                                    filterChipWidget(chipName: 'Vegetables'),
                                    filterChipWidget(chipName: 'Special Price'),
                                    filterChipWidget(
                                        chipName: 'Item of the day'),
                                    filterChipWidget(
                                        chipName: 'Buy 1, GET 1 Free'),
                                    filterChipWidget(chipName: 'Fresh'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.blueGrey,
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _titleContainer('Discount'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Wrap(
                                  spacing: 5.0,
                                  runSpacing: 5.0,
                                  children: <Widget>[
                                    filterChipWidget(chipName: '10% OR LESS'),
                                    filterChipWidget(chipName: '20% OR LESS'),
                                    filterChipWidget(chipName: '30% OR LESS'),
                                    filterChipWidget(chipName: '40% OR LESS'),
                                    filterChipWidget(chipName: '50% OR LESS'),
                                    filterChipWidget(chipName: '70% OR LESS'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.blueGrey,
                            height: 10.0,
                          ),
                        ],
                      ),
                    ],
                  )),
              _verticalDivider(),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _verticalDivider(),
                  Text(
                    'AVAILIBILITY',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              _verticalDivider(),
              Container(
                  child: Align(
                      alignment: const Alignment(0.0, -0.2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _verticalDivider(),
                          Radio<int>(
                              value: 0,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          Text(
                            'Available for this location',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))),
            ]),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  int radioValue = 0;
  bool switchValue = false;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Color(0xff6200ee),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color(0xffeadffd),
    );
  }
}

class TravelDestinationItem extends StatefulWidget {
  TravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  static const double height = 566.0;
  final Item destination;
  final ShapeBorder shape;

  @override
  _TravelDestinationItemState createState() => _TravelDestinationItemState();
}

class _TravelDestinationItemState extends State<TravelDestinationItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline5.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1;
    bool toggle = false;

    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
            padding: const EdgeInsets.all(4.0),
            height: TravelDestinationItem.height,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => item_details()));
              },
              child: Card(
                shape: widget.shape,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // photo and title
                    SizedBox(
                      height: 150.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              widget.destination.imagename,
                              // package: destination.assetPackage,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            // padding: EdgeInsets.all(5.0),
                            child: IconButton(
                              icon: toggle
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                setState(() {
                                  toggle = !toggle;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    Divider(),
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: DefaultTextStyle(
                          style: descriptionStyle,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // three line description
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  widget.destination.itemname,
                                  style: descriptionStyle.copyWith(
                                      color: Colors.black87),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  widget.destination.itmprice,
                                  style: descriptionStyle.copyWith(
                                      color: Colors.black54),
                                ),
                              ),
                              // Text(destination.description[1]),
                              // Text(destination.description[2]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // share, explore buttons
                    Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide: BorderSide(color: Colors.amber.shade500),
                          child: const Text('Add'),
                          textColor: Colors.amber.shade500,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => item_details()));
                          },
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }
}

// ---------------------------------------------------
// Helper class aimed at simplifying the way to
// automate the creation of a series of RangeSliders,
// based on various parameters
//
// This class is to be used to demonstrate the appearance
// customization of the RangeSliders
// ---------------------------------------------------
class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(
      BuildContext context, _RangeSlider.RangeSliderCallback callback) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(lowerValueText),
          ),
          Expanded(
            child: SliderTheme(
              // Customization of the SliderTheme
              // based on individual definitions
              // (see rangeSliders in _RangeSliderSampleState)
              data: SliderTheme.of(context).copyWith(
                overlayColor: overlayColor,
                activeTickMarkColor: activeTickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                thumbColor: thumbColor,
                valueIndicatorColor: valueIndicatorColor,
                showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,
              ),
              child: new _RangeSlider.RangeSlider(
                min: min,
                max: max,
                lowerValue: lowerValue,
                upperValue: upperValue,
                divisions: divisions,
                showValueIndicator: showValueIndicator,
                valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                onChanged: (double lower, double upper) {
                  // call
                  callback(lower, upper);
                },
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(upperValueText),
          ),
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testbzb/DATA_MODAL/SUB_DATA_MODAL_DASHBOARD/_data_modal_subcampaigndetail.dart';
import 'dart:convert';

import '../DATA_MODAL/SUB_DATA_MODAL_DASHBOARD/_data_modal_Aashboard.dart';
import '_no_internet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  List<Widget> _currentIndexloadApiFailed= [];
  List<Widget> ListWidgetHeaderHoneDetals = [];
  List<Widget> ListWidgetCampaignRotateBig = [];
  List<Widget> ListWidgetHeaderPromotion = [];
  List<Widget> ListWidgetPopularSupersale = [];
  List<Widget> ListWidgetOnSales = [];
  final List<Map<String, dynamic>> ListWidgetOnSalesPopup = [];
  final List<Map<String, dynamic>> ListWidgetSpecial = [];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
      print(i);
    }
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //GET https://firebasestorage.googleapis.com/v0/b/android-interview-test.appspot.com/o/dashboard.json?alt=media&token=e49c0393-c604-406e-b2bd-7ba1597ca231
    dashboard_Api();
  }

  Future<void> dashboard_Api() async {
    final response = await http.get(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/android-interview-test.appspot.com/o/dashboard.json?alt=media&token=e49c0393-c604-406e-b2bd-7ba1597ca231'));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('response ====== ${response}');
      print('response to boby ====== ${jsonResponse}');
      int indexs = 0;
      for (var snap in jsonResponse) {
        Map<String, dynamic> map = snap;
        DataModalAashboard modal = DataModalAashboard.fromJson(map);
        setState(() {
          print('----- dashboard_Api $indexs -----');
          print(indexs);
          print(modal);
          print(modal.name);
          print(modal.size);
          print(modal.subcampaigndetails);
          print(modal.description);
          print(modal.imageUrl);
          print(modal.type);
          var snap_subcampaigndetails = modal.subcampaigndetails!;
          int indexs_snap_subcampaigndetails = 0;
          for (var snap_subcampaigndetailss in snap_subcampaigndetails) {
            var map_subcampaigndetailss = snap_subcampaigndetailss;
            setState(() {
              print('indexs_snap_subcampaigndetails ---->> $indexs_snap_subcampaigndetails');
              print('type ---->> ${snap_subcampaigndetails}');
              print('map ---->> ${map}');
              print('snap_subcampaigndetailss ---->> $snap_subcampaigndetailss');
              print(map_subcampaigndetailss.description);
              print(map_subcampaigndetailss.imageUrl);
              print(map_subcampaigndetailss.name);
              print(map_subcampaigndetailss.type);

            });
            indexs_snap_subcampaigndetails++;
          }

          switch (indexs) {
            case 0:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.name);
                print(modal.type);
                ListWidgetHeaderHoneDetals.add(Hot_Detels(modal, indexs));
              }
              break;
            case 1:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.size);
                print(modal.subcampaigndetails);
                print(modal.type);
                var snap_subcampaigndetails = modal.subcampaigndetails!;
                int indexs_snap_subcampaigndetails = 0;
                for (var snap_subcampaigndetailss in snap_subcampaigndetails) {
                  var map_subcampaigndetailss = snap_subcampaigndetailss;
                  setState(() {
                    print('---------- $indexs_snap_subcampaigndetails ----------');
                    print(map_subcampaigndetailss.description);
                    print(map_subcampaigndetailss.imageUrl);
                    print(map_subcampaigndetailss.name);
                    print(map_subcampaigndetailss.type);
                    ListWidgetCampaignRotateBig.add(
                        Big_Sale(modal, indexs, map_subcampaigndetailss));
                  });
                  indexs_snap_subcampaigndetails++;
                }
              }
              break;
            case 2:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.name);
                print(modal.type);
                ListWidgetHeaderPromotion.add(
                    Text_Popular_Supersale(modal, indexs));
              }
              break;
            case 3:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.name);
                print(modal.type);
                print(modal.subcampaigndetails);
                var snap_subcampaigndetails = modal.subcampaigndetails!;
                int indexs_snap_subcampaigndetails = 0;
                for (var snap_subcampaigndetailss in snap_subcampaigndetails) {
                  var map_subcampaigndetailss = snap_subcampaigndetailss;
                  setState(() {
                    print('---------- $indexs_snap_subcampaigndetails ----------');
                    print(map_subcampaigndetailss.description);
                    print(map_subcampaigndetailss.imageUrl);
                    print(map_subcampaigndetailss.name);
                    print(map_subcampaigndetailss.type);
                    ListWidgetPopularSupersale.add(Popular_Supersale(
                        modal, indexs, map_subcampaigndetailss));
                  });
                  indexs_snap_subcampaigndetails++;
                }
              }
              break;
            case 4:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.name);
                print(modal.type);
                ListWidgetOnSales.add(Text_OnSales(modal, indexs));
              }
              break;
            case 5:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.description);
                print(modal.imageUrl);
                print(modal.name);
                print(modal.size);
                print(modal.type);
                ListWidgetOnSalesPopup.add({
                  "description": modal.description,
                  "imageUrl": modal.imageUrl,
                  "name": modal.name,
                  "size": modal.size,
                  "type":modal.type,
                },
                );
              }
              break;
            case 6:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.description);
                print(modal.imageUrl);
                print(modal.name);
                print(modal.size);
                print(modal.type);
                ListWidgetOnSalesPopup.add({
                  "description": modal.description,
                  "imageUrl": modal.imageUrl,
                  "name": modal.name,
                  "size": modal.size,
                  "type":modal.type,
                },
                );
              }
              break;
            case 7:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.description);
                print(modal.imageUrl);
                print(modal.name);
                print(modal.size);
                print(modal.type);
                ListWidgetOnSalesPopup.add({
                  "description": modal.description,
                  "imageUrl": modal.imageUrl,
                  "name": modal.name,
                  "size": modal.size,
                  "type":modal.type,
                },
                );
              }
              break;
            case 8:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.description);
                print(modal.imageUrl);
                print(modal.name);
                print(modal.size);
                print(modal.type);
                ListWidgetOnSalesPopup.add({
                  "description": modal.description,
                  "imageUrl": modal.imageUrl,
                  "name": modal.name,
                  "size": modal.size,
                  "type":modal.type,
                },
                );
              }
              break;
            case 9:
              {
                print('----------------------------------- case $indexs------------------------------------');
                print(modal.description);
                print(modal.imageUrl);
                print(modal.name);
                print(modal.size);
                print(modal.type);
                ListWidgetSpecial.add({
                  "description": modal.description,
                  "imageUrl": modal.imageUrl,
                  "name": modal.name,
                  "size": modal.size,
                  "type":modal.type,
                },
                );
              }
              break;
            default:{}
              break;
          }
          _currentIndexloadApiFailed.add(LoadApiFailed(modal,indexs));
        });
        indexs++;
      }
      return null;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 60,
              child: Card(
                margin: EdgeInsets.only(top: 17, bottom: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey,
                child: Center(
                  child: Text('TH'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: _currentIndexloadApiFailed.length == 0
            ? GestureDetector(
          onTap: (){},
          child: Container(
              child: Center(
                  child: Nointernet())),
        )
            : SingleChildScrollView(
            child:Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  child: ListWidgetHeaderHoneDetals == 0
                      ? Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          child: Row(
                            children: ListWidgetHeaderHoneDetals,
                          ),
                        )),
              SizedBox(
                height: 15,
              ),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: ListWidgetCampaignRotateBig.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Colors.blueAccent,
                          child: card,
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      map<Widget>(ListWidgetCampaignRotateBig, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.yellow[800]
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: ListWidgetHeaderPromotion == 0
                      ? Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          child: Row(
                            children: ListWidgetHeaderPromotion,
                          ),
                        )),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                child: Container(
                  child: ListWidgetPopularSupersale.length == 0
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator()))
                      : Container(
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                            child: Row(
                                          children: ListWidgetPopularSupersale,
                                        )))),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: ListWidgetOnSales == 0
                      ? Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          child: Row(
                            children: ListWidgetOnSales,
                          ),
                        )),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 20,left: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 200,
                    ),
                      itemCount: ListWidgetOnSalesPopup.length, itemBuilder: (_, index) {
                           return GestureDetector(
                             onTap: (){},
                             child: Container(
                               child: Image.network(
                                 "${ListWidgetOnSalesPopup.elementAt(index)['imageUrl']}",
                                 height: 100,
                                 width: double.infinity,
                                 fit: BoxFit.cover,
                               ),

                             ),
                           );
                         }

                  ),

                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 20,left: 20),
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 200,
                      ),
                      itemCount: ListWidgetSpecial.length, itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        child: Image.network(
                          "${ListWidgetSpecial.elementAt(index)['imageUrl']}",
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                      ),
                    );
                  }

                  ),

                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget Hot_Detels(DataModalAashboard modal, int indexs) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Text(
            '${modal.name}',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  @override
  Widget Big_Sale(DataModalAashboard modal, int indexs, Subcampaigndetail map_subcampaigndetailss) {
    return Container(
      color: Colors.grey[100],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        '${map_subcampaigndetailss.imageUrl}',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget Text_Popular_Supersale(DataModalAashboard modal, int indexs) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Text(
            '${modal.name}',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  @override
  Widget Popular_Supersale(DataModalAashboard modal, int indexs, Subcampaigndetail map_subcampaigndetailss) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 200,
      width: 170,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: map_subcampaigndetailss.imageUrl == null
                  ? Container(
                      color: Colors.grey[100],
                    )
                  : Image.network(
                      '${map_subcampaigndetailss.imageUrl}',
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    '${map_subcampaigndetailss.name}',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    '${map_subcampaigndetailss.price}',
                    style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
                ],
              ),
            ),
          ],
        ),
        shadowColor: Colors.black,
      ),
    );
  }

  @override
  Widget Text_OnSales(DataModalAashboard modal, int indexs) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Text(
            '${modal.name}',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  @override
  Widget LoadApiFailed(DataModalAashboard modal,int indexs) {
    return Container();
  }

}

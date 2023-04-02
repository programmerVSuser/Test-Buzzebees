import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DATA_MODAL/_data_modal_campaign.dart';
import '_details.dart';
import '_no_internet.dart';
class Campaigns extends StatefulWidget {
  const Campaigns({Key? key}) : super(key: key);

  @override
  State<Campaigns> createState() => _CampaignsState();
}
class _CampaignsState extends State<Campaigns> {
  final List<Map<String, dynamic>> ListWidgetCampaigns = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Campaign_Api();
  }
  Future<void> Campaign_Api()async{
    final response = await http.get(Uri.parse('https://firebasestorage.googleapis.com/v0/b/android-interview-test.appspot.com/o/campaigns.json?alt=media&token=2c4ae9ee-79f1-429e-8e68-47a176ec9348'));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('-----*----- Campaign_Api -----*-----');
      print('response ====== ${response}');
      print('response to boby ====== ${jsonResponse}');
      int indexs = 0;
      for (var snap in jsonResponse) {
        Map<String, dynamic> map = snap;
        DataModalCampaiggn modal =  DataModalCampaiggn.fromMap(map);
        print('map------- ${map}');
        setState(() {
          print(indexs);
          print(modal.name);
          print(modal.price);
          print(modal.description);
          print(modal.image_url);

          // ListWidgetCampaigns.add({
          //   "name": modal.name,
          //   "price": modal.price,
          //   "description": modal.description,
          //   "imageUrl": modal.image_url,
          //   "stasus": '0'
          //
          // },);}

          switch (indexs) {
            case 0 :{
              ListWidgetCampaigns.add({
              "name": modal.name,
              "price": modal.price,
              "description": modal.description,
              "imageUrl": modal.image_url,
              "stasus": '0'
            },);
            }
            break;
            case 1 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '0'

              },);}
            break;
            case 2 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '1'

              },);}
            break;
            case 3 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '1'

              },);}
            break;
            case 4 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '1'

              },);}
            break;
            case 5 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '1'

              },);}
            break;
            case 6 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '1'

              },);}
            break;
            case 7 :{
              ListWidgetCampaigns.add({
                "name": modal.name,
                "price": modal.price,
                "description": modal.description,
                "imageUrl": modal.image_url,
                "stasus": '1'

              },);}
            break;
            default:{}
            break;
          }
        });
        indexs++;
      }
      return null;
    }else{ throw Exception('Failed to load');}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Campaigns',
        style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w700),),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: (){
              BUTTON_TH();
              },
            child: Container(
              width: 60,
            child: Card(
              margin: EdgeInsets.only(top: 17,bottom: 17),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),),
              color: Colors.grey,
              child: Center(child: Text('TH'),),
            ),
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Container(
       child: ListWidgetCampaigns.length == 0
           ? GestureDetector(
             onTap: (){},
             child: Container(
               child: Nointernet()),
           )
           :  SingleChildScrollView(
             child: Container(
             child: Padding(
             padding: EdgeInsets.only(right: 20,left: 20,top: 20),
             child: GridView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 12.0,
                   mainAxisSpacing: 12.0,
                   mainAxisExtent: 200,
                 ),
                 itemCount: ListWidgetCampaigns.length, itemBuilder: (_, index) {
               return GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(
                     name: ListWidgetCampaigns.elementAt(index)['name'],
                     price: ListWidgetCampaigns.elementAt(index)['price'],
                     description: ListWidgetCampaigns.elementAt(index)['description'],
                     image_url: ListWidgetCampaigns.elementAt(index)['imageUrl'],
                     status: ListWidgetCampaigns.elementAt(index)['stasus'],
                   )));
                 },
                 child: Card(
                   child: Column(
                     children: [
                       Container(
                     height: 100,width: double.infinity,
                     child: Image.network("${ListWidgetCampaigns.elementAt(index)['imageUrl']}",
                     height: 120, width: double.infinity, fit: BoxFit.cover,),),
                       SizedBox(height: 5,),
                       Container(
                         padding: EdgeInsets.only(right: 10,left: 10,),
                         height: 28,
                         child: Row(
                         children: [
                           Expanded(child: Text("${ListWidgetCampaigns.elementAt(index)['name']}",
                           style: TextStyle(color: Colors.grey[900],fontSize: 14,fontWeight:FontWeight.w500),
                           )),
                         ],
                       ),),
                       Container(
                         padding: EdgeInsets.only(right: 10,left: 10,),
                         height: 28,
                         child: Row(
                           children: [
                             Expanded(child: Text("${ListWidgetCampaigns.elementAt(index)['price']}",
                               style: TextStyle(color:Colors.yellow[700],fontSize: 18,fontWeight:FontWeight.w500),
                             )),
                             GestureDetector(
                                 onTap: (){
                                   setState(() {

                                   });
                                 },
                                 child: Container(
                                   height: 20,width: 20,
                                   child: Center(
                                       child: Expanded(
                                           child: ListWidgetCampaigns.elementAt(index)['stasus'] == '0'
                                               ? Image.asset('asset/icons/heart1.png')
                                               : Image.asset('asset/icons/heart.png'))
                                   ),
                                 )
                             ),

                           ],
                         ),)
                     ],
                   ),
                 ),
               );
             }

             ),

         ),
       ),
           ),
     )
    );
  }
  Future<void> BUTTON_TH()async {}
  Future<void> Set_Status()async {}
}

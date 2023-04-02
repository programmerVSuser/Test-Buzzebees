import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Details extends StatefulWidget {
  late String name;
  late String price;
  late String description;
  late String image_url;
  late String status;
  Details({
    required this.name,
    required this.price,
    required this.description,
    required this.image_url,
    required this.status,
  });
  @override
  State<Details> createState() => _DetailsState(
      name,
      price,
      description,
      image_url,
      status
  );
}

class _DetailsState extends State<Details> {
  late String name;
  late String price;
  late String description;
  late String image_url;
  late String status;
  _DetailsState(
      this.name,
      this.price,
      this.description,
      this.image_url,
      this.status,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',
          style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w700),),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,width: double.infinity,
                child: Image.network(image_url,fit: BoxFit.fill,),),
              Container(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      child: Row(
                        children: [
                          Text('SPECIAL DEALS',style: TextStyle(color: Colors.grey[700],fontSize: 12,fontWeight: FontWeight.w500),),
                        ],
                      ),),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('$name',style: TextStyle(color: Colors.grey[900],fontSize: 16,fontWeight: FontWeight.w500),),
                          GestureDetector(
                              onTap: (){},
                              child: Container(
                                height: 20,width: 20,
                                child: Center(
                                    child: Expanded(
                                        child: status == '0'
                                            ? Image.asset('asset/icons/heart1.png')
                                            : Image.asset('asset/icons/heart.png'))
                                ),
                              )
                          ),
                        ],
                      ),),
                    SizedBox(height: 5,),
                    Divider(
                      height: 2,
                      color: Colors.grey[900],),
                    SizedBox(height: 5,),
                    Container(
                      child: Row(
                        children: [
                          Text('$price',style: TextStyle(color: Colors.yellow[800],fontWeight: FontWeight.w700,fontSize: 16),)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: Row(
                        children: [
                          Text('Details',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w700,fontSize: 16),)
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Row(
                        children: [
                          Expanded(child: Text('$description',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w400,fontSize: 14),))
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

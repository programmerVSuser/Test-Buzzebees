import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nointernet extends StatelessWidget {
  const Nointernet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,width: 70,
                child:Center(
                  child: Image.asset('asset/icons/Car.png'),
                ) ,),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: Text('NO CONNECTION',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w700,fontSize: 18),),
                ),),
              SizedBox(height: 5,),
              Container(
                height: 45,width: 120,
                child: Card(
                  color: Colors.orange,
                  child: Center(
                    child: Text('TRY AGAIN',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

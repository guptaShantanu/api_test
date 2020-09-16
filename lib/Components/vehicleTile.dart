import 'package:apitest/Screens/vehicleDetail_screen.dart';
import 'package:flutter/material.dart';

class VehicleTile extends StatelessWidget {
  final String id;
  final String name;
  final String brand;
  final String price;

  VehicleTile({this.id,this.name,this.brand,this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(brand),
        trailing: Text(price),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return VehicleDetail(vehicleId: id,);
          }));
        },
      ),
    );
  }
}
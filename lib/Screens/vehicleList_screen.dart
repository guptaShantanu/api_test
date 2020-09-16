import 'package:apitest/Components/vehicleTile.dart';
import 'package:apitest/Services/network_service.dart';
import 'package:flutter/material.dart';

class VehicleList extends StatefulWidget {
  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  List vehicleList = [];
  NetworkService networkService;


  @override
  void initState() {
    networkService = NetworkService();
    loadList();
    super.initState();
  }

  void loadList()async{
    var list = await networkService.getVehicleList();
    if(list!=null){
      setState(() {
        vehicleList = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: vehicleList.length==0?CircularProgressIndicator():ListView.builder(
            itemCount: vehicleList.length,
            itemBuilder: (BuildContext context,int index){
              return VehicleTile(
                name:vehicleList[index]['name'],
                brand:vehicleList[index]['brand'],
                price:vehicleList[index]['price'].toString(),
                id:vehicleList[index]['id'].toString(),
              );
            }),
      )
    );
  }
}



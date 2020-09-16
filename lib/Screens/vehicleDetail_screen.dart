import 'package:apitest/Constants/constant.dart';
import 'package:apitest/Services/network_service.dart';
import 'package:flutter/material.dart';


class VehicleDetail extends StatefulWidget {
  final String vehicleId;
  VehicleDetail({this.vehicleId});
  @override
  _VehicleDetailState createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {

  var vehicleData = {
    'name':'',
    'brand':'',
    'price':'',
    'imageUrl':'',
    'brandImageUrl':'',
    'retailPrice':'',
    'downpayment':''
  };

  NetworkService networkService = new NetworkService();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData()async {
    var data = await networkService.getVehicleData(widget.vehicleId);
    setState(() {
      vehicleData['name'] = data['name'];
      vehicleData['imageUrl'] = data['image'];
      vehicleData['brandImageUrl'] = data['brand']['icon'];
      vehicleData['retailPrice'] = data['price'].toString();
      vehicleData['downpayment'] = data['loan']['downpayment'].toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          child:Column(
            children:[
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(vehicleData['imageUrl']),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border:Border.all(width: 1,color: Colors.blueGrey)
                ),
                child: ListTile(
                  leading: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(vehicleData['brandImageUrl'])
                      )
                    ),
                  ),
                  title: Text(vehicleData['name']),
                  subtitle: Text(vehicleData['brand']),

                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 200.0,
                child: Column(
                  children: [
                    Text('Retail price'),
                    Text('₹'+vehicleData['retailPrice'],
                    style: KBoldTextHeadingStyle),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('DownPayment'),
                    Text('₹'+vehicleData['downpayment'],
                      style: KBoldTextHeadingStyle),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Intersed in the E-rickshaw',
                  style: KSemiBoldTextHeadingStyle,
                ),
              )
            ]
          )
        ),
      )
    );
  }
}

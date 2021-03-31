import 'package:flutter/material.dart';
import 'package:ghum_fir/models/Trip.dart';
import 'package:ghum_fir/screens/details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(title: 'Pokhara', price: '3200', nights: '3', img: 'pokhara.jpg'),
      Trip(title: 'Ghandruk', price: '4000', nights: '2', img: 'ghandruk.jpg'),
      Trip(title: 'Chitwan', price: '1750', nights: '2', img: 'chitwan.jpg'),
      Trip(title: 'Jomsom', price: '6000', nights: '4', img: 'jomsom.jpg'),
    ];

    _trips.forEach((Trip trip) {
      _tripTiles.add(_buildTile(trip));
    });
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(trip.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${trip.img}',
          height: 50.0,
        ),
      ),
      trailing: Text('${trip.price} Rs.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _tripTiles.length,
        itemBuilder: (context, index) {
          return _tripTiles[index];
        });
  }
}

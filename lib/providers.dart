import 'package:flutter/cupertino.dart';
import 'package:pagination_http_provider/passenger_api.dart';

import 'passenger_model.dart';

class PassengersProvider extends ChangeNotifier {
  Future<bool>? _isLoad = null;
  int _page = 1;
  int? _totalPage;
  List<Passenger> _data = []; // Empty list.

  ///
  Future<bool>? get isLoad => _isLoad;
  int get page => _page;
  int? get totalPage => _totalPage;
  List<Passenger> get data => _data;

  void load() {
    if (isLoad == null) {
      _isLoad = PassengerApi.getPassenger()!.then((value) {
        _totalPage = value.totalPages!;
        value.data!
            .map((Passenger e) => _data.add(Passenger(
                id: e.id,
                name: e.name,
                airline: e.airline,
                trips: e.trips,
                v: e.v)))
            .toList();

        return true;
      });
    }
  }
}

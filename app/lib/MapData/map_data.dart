import 'bus_stop.dart';
import 'data.dart';

class MapData
{
  late final Set<BusStop> _busStops;
  late final Set<Data> _uniBuildings;
  late final Set<Data> _landmarks;

  MapData()
  {
    _busStops = <BusStop>{};
    _uniBuildings = <Data>{};
    _landmarks = <Data>{};
    // TODO: remove this test data
    _busStops.add(BusStop("Bus stop ID", "Bus stop Name", -1.0832318, 50.7937047));
    _uniBuildings.add(Data("Uni building ID", "Uni building Name", -1.0882318, 50.7937047));
    _landmarks.add(Data("Landmark ID", "Landmark Name", -1.0932318, 50.7937047));
  }

  Set<BusStop> getBusStops()
  {
    return _busStops;
  }

  Set<Data> getUniBuildings()
  {
    return _uniBuildings;
  }

  Set<Data> getLandmarks()
  {
    return _landmarks;
  }
}
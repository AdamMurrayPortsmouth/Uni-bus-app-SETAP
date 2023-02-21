import 'map_data.dart';

class MapDataLoader
{
  static MapDataLoader? _handler;
  late MapData _data;
  bool _loadingFinished = false;

  Function(MapData)? _dataLoaded;

  MapDataLoader._();

  static MapDataLoader getDataLoader()
  {
    _handler ??= MapDataLoader._();
    return _handler!;
  }

  load()
  {
    // TODO: remove test and implement the load function
    _data = MapData();


    _loadingFinished = true;
    if (_dataLoaded == null)
    {
        return;
    }
    _dataLoaded!(_data);
  }

  onDataLoaded(Function(MapData) dataLoaded)
  {
    _dataLoaded = dataLoaded;
    if (_loadingFinished)
    {
      dataLoaded(_data);
    }
  }
}
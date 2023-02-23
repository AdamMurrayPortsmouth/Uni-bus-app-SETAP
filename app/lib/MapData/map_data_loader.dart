import 'map_data.dart';

class MapDataLoader
{
  static MapDataLoader? _mapDataLoader;
  late MapData _data;
  bool _loadingFinished = false;

  Function(MapData)? _dataLoaded;

  MapDataLoader._();

  static MapDataLoader getDataLoader()
  {
    _mapDataLoader ??= MapDataLoader._();
    return _mapDataLoader!;
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
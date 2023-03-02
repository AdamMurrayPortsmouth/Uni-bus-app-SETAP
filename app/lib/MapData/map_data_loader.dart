import 'map_data.dart';

/// This loads the information from the backend and allows the frontend to
/// access it.
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

  /// This loads the information and if
  /// onDataLoaded() has been called it runs the
  /// function given to onDataLoaded().
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

  /// Sets the function to be called once the information has finished being
  /// loaded, if it has already finished being loaded then it runs the function.
  onDataLoaded(Function(MapData) dataLoaded)
  {
    _dataLoaded = dataLoaded;
    if (_loadingFinished)
    {
      dataLoaded(_data);
    }
  }
}
import 'dart:async';
import 'package:get/get.dart';
part 'app_event.dart';

class AppEventChannel {
  static AppEventChannel? _eventBus;
  final _streamController = StreamController.broadcast(sync: false);
  final _lastEvent = <IAppEvent>[];

  factory AppEventChannel() => _eventBus ??= AppEventChannel._internal();

  AppEventChannel._internal();

  ///Register listener which listen to custom event that implements IEvent
  Stream<T> on<T extends IAppEvent>() {
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  ///Fire a custom event that implements IEvent
  void addEvent<T extends IAppEvent>(T event) {
    _streamController.add(event);
    _lastEvent.removeWhere((element) => element is T);
    _lastEvent.add(event);
  }

  T? getLastEvent<T extends IAppEvent>() {
    return _lastEvent.firstWhereOrNull((element) => element is T) as T?;
  }

  void clearLastEvent<T extends IAppEvent>() => _lastEvent.removeWhere((element) => element is T);

//avoid destroy, use only for testing
//void destroy() => _streamController.close();
}
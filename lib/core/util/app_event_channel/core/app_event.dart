part of 'app_event_channel.dart';

abstract class IAppEvent<T> {
  T data;

  IAppEvent(this.data);
}
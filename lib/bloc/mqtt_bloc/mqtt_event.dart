part of "mqtt_bloc.dart";

abstract class MQTTEvent extends Equatable {
  const MQTTEvent();
  @override
  List<Object> get props => [];
}

class MQTTInitialEvent extends MQTTEvent {
  final String email;

  const MQTTInitialEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class MQTTServerStartEvent extends MQTTEvent {
  final String host;
  final String clientId;
  final String port;

  const MQTTServerStartEvent(
      {required this.host, required this.clientId, required this.port});

  @override
  List<Object> get props => [host, clientId, port];
}

class MQTTSubscribeTopic extends MQTTEvent {
  final String topic;

  const MQTTSubscribeTopic({required this.topic});

  @override
  List<Object> get props => [topic];
}

class MQTTServerStopEvent extends MQTTEvent {
  @override
  List<Object> get props => [];
}

class MQTTUnsubscribeTopic extends MQTTEvent {
  @override
  List<Object> get props => [];
}

class MQTTPublishMessage extends MQTTEvent {
  final String message;

  const MQTTPublishMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class MQTTGetMessage extends MQTTEvent {
  final String message;

  const MQTTGetMessage({required this.message});

  @override
  List<Object> get props => [message];
}

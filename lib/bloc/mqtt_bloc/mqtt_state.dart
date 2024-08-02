part of "mqtt_bloc.dart";

class MQTTState extends Equatable {
  const MQTTState({
    this.host = '',
    this.clientId = '',
    this.topic = '',
    this.port = 0,
    this.messages = const [],
    this.isStarted = false,
    this.isSubscribed = false,
    this.isloading = false,
  });

  final String host;
  final String clientId;
  final String topic;
  final int port;
  final List<MessageModel> messages;
  final bool isStarted;
  final bool isSubscribed;
  final bool isloading;

  MQTTState copyWith({
    String? host,
    String? clientId,
    String? topic,
    int? port,
    List<MessageModel>? messages,
    bool? isStarted,
    bool? isSubscribed,
    bool? isloading,
  }) {
    return MQTTState(
      host: host ?? this.host,
      clientId: clientId ?? this.clientId,
      topic: topic ?? this.topic,
      port: port ?? this.port,
      messages: messages ?? this.messages,
      isStarted: isStarted ?? this.isStarted,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      isloading: isloading ?? this.isloading,
    );
  }

  @override
  List<Object?> get props => [
        host,
        clientId,
        topic,
        port,
        messages,
        isStarted,
        isSubscribed,
        isloading
      ];
}

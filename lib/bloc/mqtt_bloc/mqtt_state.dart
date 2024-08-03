part of "mqtt_bloc.dart";

class MQTTState extends Equatable {
  MQTTState({
    this.host = '',
    this.clientId = '',
    this.topic = '',
    this.statusMessage = '',
    this.port = 0,
    this.messages = const [],
    this.isStarted = false,
    this.isloading = false,
    this.apiStatus = ApiStatus.initial,
  });

  final String host;
  final String clientId;
  final String topic;
  final String statusMessage;
  final int port;
  List<MessageModel> messages;
  final bool isStarted;
  final bool isloading;
  final ApiStatus apiStatus;

  MQTTState copyWith({
    String? host,
    String? clientId,
    String? topic,
    String? statusMessage,
    int? port,
    List<MessageModel>? messages,
    bool? isStarted,
    bool? isloading,
    ApiStatus? apiStatus,
  }) {
    return MQTTState(
      host: host ?? this.host,
      clientId: clientId ?? this.clientId,
      topic: topic ?? this.topic,
      port: port ?? this.port,
      messages: messages ?? this.messages,
      isStarted: isStarted ?? this.isStarted,
      isloading: isloading ?? this.isloading,
      apiStatus: apiStatus ?? this.apiStatus,
      statusMessage: statusMessage ?? this.statusMessage,
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
        isloading,
        apiStatus,
        statusMessage,
      ];
}

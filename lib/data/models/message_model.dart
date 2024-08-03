import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String message;
  final String topic;
  final String date;
  final String time;

  const MessageModel(
      {required this.message,
      required this.topic,
      required this.date,
      required this.time});

  @override
  List<Object?> get props => [message, topic, date, time];
}

import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String message;
  final String clientId;
  final String date;
  final String time;

  const MessageModel(
      {required this.message,
      required this.clientId,
      required this.date,
      required this.time});

  @override
  List<Object?> get props => [message, clientId, date, time];
}

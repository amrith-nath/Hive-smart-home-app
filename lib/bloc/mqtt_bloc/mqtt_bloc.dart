import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/data/data.dart';
import 'package:hive/data/models/message_model.dart';
import 'package:hive/utils/utils.dart';
import 'package:mqtt_client/mqtt_client.dart';
part 'mqtt_event.dart';
part 'mqtt_state.dart';

class MQTTBloc extends Bloc<MQTTEvent, MQTTState> {
  late MQTTService mqttService;

  MQTTBloc() : super(MQTTState()) {
    on<MQTTInitialEvent>(_onMQTTInitialEvent);
    on<MQTTServerStartEvent>(_onMQTTServerStartEvent);
    on<MQTTSubscribeTopic>(_onMQTTSubscribeTopic);
    on<MQTTServerStopEvent>(_onMQTTServerStopEvent);
    on<MQTTPublishMessage>(_onMQTTPublishMessage);
    on<MQTTGetMessage>(_onMQTTGetMessage);
  }
  _onMQTTInitialEvent(MQTTInitialEvent event, Emitter<MQTTState> emit) {}

  _onMQTTServerStartEvent(
      MQTTServerStartEvent event, Emitter<MQTTState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    mqttService = MQTTService(
        clientId: event.clientId,
        host: event.host,
        port: int.parse(event.port));

    await mqttService.connect().then((isConnected) {
      if (isConnected) {
        emit(state.copyWith(
          statusMessage: "MQTT client connection successful",
          apiStatus: ApiStatus.success,
          isStarted: true,
        ));
      } else {
        emit(state.copyWith(
          statusMessage: "MQTT client connection failed",
          apiStatus: ApiStatus.error,
          isStarted: false,
        ));
      }
    });
  }

  _onMQTTServerStopEvent(MQTTServerStopEvent event, Emitter<MQTTState> emit) {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    mqttService.disconnect();
    emit(state.copyWith(
      statusMessage: "Server disconnected",
      apiStatus: ApiStatus.success,
      isStarted: false,
    ));
  }

  _onMQTTSubscribeTopic(
      MQTTSubscribeTopic event, Emitter<MQTTState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading, topic: event.topic));
    mqttService.subscribe(event.topic);
    emit(state.copyWith(
      statusMessage: "Subscribed to ${event.topic}",
      apiStatus: ApiStatus.success,
    ));

    await emit.forEach(mqttService.client.updates!, onData: (data) {
      final MqttPublishMessage recMess = data[0].payload as MqttPublishMessage;
      final String payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      log("Received message: $payload from topic: ${data.length}");
      if (state.messages.isEmpty) {
        state.messages = [
          MessageModel(
              message: payload,
              topic: data[0].topic,
              date: "date",
              time: "time")
        ];
      } else {
        state.messages = [
          ...state.messages,
          MessageModel(
              message: payload.trim(),
              topic: data[0].topic,
              date: "date",
              time: "time")
        ];
      }
      return state.copyWith(
          statusMessage:
              "Received message: $payload from topic: ${data[0].topic}");
    });
  }

  _onMQTTGetMessage(MQTTGetMessage event, Emitter<MQTTState> emit) {}

  _onMQTTPublishMessage(MQTTPublishMessage event, Emitter<MQTTState> emit) {
    if (state.topic.isEmpty) {
      emit(state.copyWith(
          apiStatus: ApiStatus.error, statusMessage: "Add a topic first"));
    } else {
      mqttService.publish(state.topic, event.message);
    }
  }
}

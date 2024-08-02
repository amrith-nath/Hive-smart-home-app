import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/data/models/message_model.dart';
part 'mqtt_event.dart';
part 'mqtt_state.dart';

class MQTTBloc extends Bloc<MQTTEvent, MQTTState> {
  MQTTBloc() : super(const MQTTState()) {
    on<MQTTInitialEvent>(_onMQTTInitialEvent);
    on<MQTTServerStartEvent>(_onMQTTServerStartEvent);
    on<MQTTSubscribeTopic>(_onMQTTSubscribeTopic);
    on<MQTTServerStopEvent>(_onMQTTServerStopEvent);
    on<MQTTUnsubscribeTopic>(_onMQTTUnsubscribeTopic);
    on<MQTTPublishMessage>(_onMQTTPublishMessage);
    on<MQTTGetMessage>(_onMQTTGetMessage);
  }
  _onMQTTInitialEvent(MQTTInitialEvent event, Emitter<MQTTState> emit) {}

  _onMQTTServerStartEvent(
      MQTTServerStartEvent event, Emitter<MQTTState> emit) {}

  _onMQTTSubscribeTopic(MQTTSubscribeTopic event, Emitter<MQTTState> emit) {}

  _onMQTTServerStopEvent(MQTTServerStopEvent event, Emitter<MQTTState> emit) {}

  _onMQTTGetMessage(MQTTGetMessage event, Emitter<MQTTState> emit) {}

  _onMQTTUnsubscribeTopic(
      MQTTUnsubscribeTopic event, Emitter<MQTTState> emit) {}

  _onMQTTPublishMessage(MQTTPublishMessage event, Emitter<MQTTState> emit) {}
}

import 'dart:developer';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  final MqttServerClient client;
  final String clientId;

  MQTTService({
    required this.clientId,
    required String host,
    required int port,
  }) : client = MqttServerClient.withPort(host, clientId, port);

  Future<void> connect() async {
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    log('MQTT client connecting....');
    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } on Exception catch (e) {
      log('Exception: $e');
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      log('MQTT client connected');
    } else {
      log('ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
    }
  }

  void disconnect() {
    log('MQTT client disconnecting....');
    client.disconnect();
  }

  void onConnected() {
    log('MQTT client connected');
  }

  void onDisconnected() {
    log('MQTT client disconnected');
  }

  void onSubscribed(String topic) {
    log('Subscribed to topic: $topic');
  }

  void onSubscribeFail(String topic) {
    log('Failed to subscribe $topic');
  }

  void pong() {
    log('Ping response client callback invoked');
  }

  void subscribe(String topic) {
    log('Subscribing to $topic');
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!,
        retain: true);
  }
}

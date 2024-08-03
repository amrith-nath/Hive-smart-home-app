import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/bloc/mqtt_bloc/mqtt_bloc.dart';
import 'package:hive/config/config.dart';
import 'package:hive/utils/utils.dart';
import 'package:hive/views/mqtt/widgets/mqtt_display.dart';
import 'package:hive/views/mqtt/widgets/mqtt_server_widget.dart';
import 'package:hive/views/mqtt/widgets/widgets.dart';

class ScreenMQTT extends StatefulWidget {
  const ScreenMQTT({super.key});

  @override
  State<ScreenMQTT> createState() => _ScreenMQTTState();
}

class _ScreenMQTTState extends State<ScreenMQTT> {
  // late MQTTService mq;
  late MQTTBloc _mqttBloc;

  TextEditingController hostController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController clientIdController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    // mq = MQTTService(
    //     clientId: "flutter_client", host: "broker.emqx.io", port: 1883);

    _mqttBloc = MQTTBloc();
    super.initState();
  }

  @override
  void dispose() {
    hostController.dispose();
    portController.dispose();
    clientIdController.dispose();
    topicController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _mqttBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("MQTT"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const MQTTdisplayWidget(),
              20.vh,
              MQTTServerWidget(
                hostController: hostController,
                portController: portController,
                clientIdController: clientIdController,
              ),
              10.vh,
              const Divider(),
              10.vh,
              MQTTSubscribeWidget(topicController: topicController),
              10.vh,
              const Divider(),
              10.vh,
              MQTTMessageWidget(
                messageController: messageController,
              )
            ],
          ),
        ),
      ),
    );
  }
}

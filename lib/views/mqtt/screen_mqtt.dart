import 'package:flutter/material.dart';
import 'package:hive/config/config.dart';
import 'package:hive/utils/utils.dart';
import 'package:hive/views/mqtt/mqtt_temp.dart';

class ScreenMQTT extends StatefulWidget {
  const ScreenMQTT({super.key});

  @override
  State<ScreenMQTT> createState() => _ScreenMQTTState();
}

class _ScreenMQTTState extends State<ScreenMQTT> {
  // late MQTTService mq;

  @override
  void initState() {
    // mq = MQTTService(
    //     clientId: "flutter_client", host: "broker.emqx.io", port: 1883);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("MQTT"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: KColors.iconBgInactive,
                border: Border.all(color: KColors.textSecondary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            20.vh,
            Row(
              children: [
                const Flexible(
                    flex: 2, child: BaseTextFieldWidget(label: "Host")),
                10.vw,
                const Flexible(child: BaseTextFieldWidget(label: "Port")),
              ],
            ),
            10.vh,
            Row(
              children: [
                const Flexible(
                    flex: 2, child: BaseTextFieldWidget(label: "Client ID")),
                10.vw,
                Flexible(
                    child: PrimaryButtonWidget(
                  height: 40,
                  label: "Start",
                  onTap: () {},
                )),
              ],
            ),
            10.vh,
            const Divider(),
            10.vh,
            Row(
              children: [
                const Flexible(
                    flex: 2, child: BaseTextFieldWidget(label: "Topic")),
                10.vw,
                Flexible(
                    child: PrimaryButtonWidget(
                  height: 40,
                  label: "Subscribe",
                  onTap: () {},
                )),
              ],
            ),
            10.vh,
            const Divider(),
            10.vh,
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: KColors.iconBgInactive,
                    ),
                  ),
                ),
                10.vw,
                Flexible(
                    child: PrimaryButtonWidget(
                        height: 50, onTap: () {}, label: "Send"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

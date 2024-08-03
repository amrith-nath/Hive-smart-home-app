# hive

A new Flutter project.

## Getting Started

This project is a Flutter application for a smart
home dashboard that interacts with BLE
devices, subscribes to MOTT topics, and
displays sensor data with Firebase Authentication.

## How to use 
A few resources to get you started if you want to test the application:

- [Recent apk build](https://1drv.ms/u/s!AonmIAgOPvw4i3oAXTYqYfmPmQ5B)
- [Demo video](https://1drv.ms/v/s!AonmIAgOPvw4i3mWQ_NjY7HpPleV)

### authentication :
Basic Firebase authentication with Email and password includes signup, signin and user management

if you want to run it from code need to initialize firebase with your firbase account through `firebase cli`.
Just install Firebase cli tool run `Firebase init` and complete the whole prompt It will install the necessary firebase service files needed.

### BLE device management:
Feature not yet completed

### MQTT subscription and message display
To try that feature I will recommend installing
-[MQTTX](https://mqttx.app/) on your system and start a connection with any subscription

Inside app give `host : broker.emqx.io` , `port : 1883` and `clientID : flutter_client`

nb: Try to refresh MQTTX id on timeout 
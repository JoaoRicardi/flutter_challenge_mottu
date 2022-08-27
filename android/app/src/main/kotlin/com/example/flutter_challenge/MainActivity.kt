package com.example.flutter_challenge

import com.example.flutter_challenge.channel.method.airplane.AirPlaneMethodChannel
import com.example.flutter_challenge.channel.stream.airplane.AirPlaneModeChannelStream
import com.example.flutter_challenge.channel.stream.connectivity.ConnectivityChannelStream
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel


class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        handleAirPlaneMode(flutterEngine = flutterEngine)

        handleConnectionType(flutterEngine = flutterEngine)

    }




    private fun handleAirPlaneMode(flutterEngine: FlutterEngine){
        ///registrando o stream para ter o envio de dados para o flutter
        val airPlaneStreamHandler = AirPlaneModeChannelStream()

        ///registrando o eventchannel para streaming de dados pro flutter
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, airPlaneStreamHandler.channelId)
                .setStreamHandler(airPlaneStreamHandler)

        ///registrando na engine do flutter para caso a sejam invocadas no flutter
        val airPlaneMethodChanel = AirPlaneMethodChannel(this, airPlaneStreamHandler)
        airPlaneMethodChanel.setCustomMethodCallHandler(flutterEngine)
    }

    private fun handleConnectionType(flutterEngine: FlutterEngine){
        val connectivityStream = ConnectivityChannelStream(this)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, connectivityStream.channelId)
                .setStreamHandler(connectivityStream)

    }
}


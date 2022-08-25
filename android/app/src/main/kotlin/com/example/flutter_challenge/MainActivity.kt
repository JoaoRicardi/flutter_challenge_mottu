package com.example.flutter_challenge

import android.content.Intent
import android.content.IntentFilter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel


class MainActivity: FlutterActivity() {

    private val connectionEventChannel = "platform_channel_events/connectivity"
    private val airPlaneEventChannel = "platform_channel_events/airplaneMode"
    val streamHandelr = AirPlaneModeStreamHandler()


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, connectionEventChannel)
                .setStreamHandler(NetworkStreamHandler(this))

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, airPlaneEventChannel)
                .setStreamHandler(streamHandelr)


        val receiver = AirPlaneModeReceiver(streamHandelr)
        val intentFilter = IntentFilter(Intent.ACTION_AIRPLANE_MODE_CHANGED)
        this.registerReceiver(receiver, intentFilter)
    }
}
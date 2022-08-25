package com.example.flutter_challenge

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.EventChannel

class AirPlaneModeStreamHandler: EventChannel.StreamHandler {

    var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }
}

class AirPlaneModeReceiver(val streamHandler: AirPlaneModeStreamHandler): BroadcastReceiver(){

    override fun onReceive(context: Context?, intent: Intent?) {
        val state: Boolean = intent?.getBooleanExtra("state", false) ?:  false
        streamHandler.eventSink?.success(state)

    }

}
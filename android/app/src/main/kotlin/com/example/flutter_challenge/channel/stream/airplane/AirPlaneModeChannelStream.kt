package com.example.flutter_challenge.channel.stream.airplane

import com.example.flutter_challenge.channel.base.BaseStream
import io.flutter.plugin.common.EventChannel

class AirPlaneModeChannelStream: EventChannel.StreamHandler, BaseStream {

    override val channelId: String = "flutter_challenge/airplaneMode"
    override var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

}
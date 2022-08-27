package com.example.flutter_challenge.channel.base

import io.flutter.plugin.common.EventChannel

interface BaseStream {
    var eventSink: EventChannel.EventSink?
    val channelId: String
}
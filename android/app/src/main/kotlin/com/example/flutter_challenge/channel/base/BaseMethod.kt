package com.example.flutter_challenge.channel.base

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

interface BaseMethod {
    val channel: String
    val methodChannelHandler: MethodChannel.MethodCallHandler
    fun setCustomMethodCallHandler(flutterEngine: FlutterEngine)
}
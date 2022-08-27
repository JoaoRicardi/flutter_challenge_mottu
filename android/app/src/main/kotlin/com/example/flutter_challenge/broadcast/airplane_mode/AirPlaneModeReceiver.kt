package com.example.flutter_challenge.broadcast.airplane_mode

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.example.flutter_challenge.channel.stream.airplane.AirPlaneModeChannelStream


class AirPlaneModeReceiver(private val streamHandler: AirPlaneModeChannelStream): BroadcastReceiver(){

    override fun onReceive(context: Context?, intent: Intent?) {
        val state: Boolean = intent?.getBooleanExtra("state", false) ?:  false
        streamHandler.eventSink?.success(state)
    }
}
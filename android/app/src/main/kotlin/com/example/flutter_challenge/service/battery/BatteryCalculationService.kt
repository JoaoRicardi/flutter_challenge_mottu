package com.example.flutter_challenge.service.battery

import android.app.Service
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Binder
import android.os.IBinder
import com.example.flutter_challenge.interfaces.baterry.OnBatteryChange


class BatteryCalculationService: Service() {

    private val binder: IBinder = LocalBinder(this)

    private var onServiceCallback : OnBatteryChange? = null


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return super.onStartCommand(intent, flags, startId)
    }


    override fun onBind(intent: Intent?): IBinder {
        return binder
    }

    fun setOnServiceCallback(onServiceCallback : OnBatteryChange?){
        this.onServiceCallback = onServiceCallback


        val ifilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        val batteryStatus = registerReceiver(null, ifilter)

        val level = batteryStatus!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
        val scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1)

        val batteryPct = level / scale.toFloat()

        val batteryToReturn = (batteryPct * 100).toInt()

        onServiceCallback?.onBatteryLifeChanged(batteryToReturn)
    }

}



class LocalBinder(private val batteryServiceInstance: BatteryCalculationService) : Binder() {
    fun getService(): BatteryCalculationService{
        return batteryServiceInstance
    }
}
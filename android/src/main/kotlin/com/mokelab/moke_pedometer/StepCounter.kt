package com.mokelab.moke_pedometer

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.plugin.common.MethodChannel

class StepCounter(private val context: Context) {
    private val sensorManager: SensorManager = context.getSystemService(SensorManager::class.java)
    private val sensor = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER)

    fun getStepCount(result: MethodChannel.Result) {
        val listener = object : SensorEventListener {
            override fun onSensorChanged(event: SensorEvent?) {
                if (event == null) return
                val count = event.values[0].toInt()
                result.success(
                    mapOf(
                        "steps" to count,
                        "floor_up" to 0,
                        "floor_down" to 0
                    )
                )
                sensorManager.unregisterListener(this)
            }

            override fun onAccuracyChanged(p0: Sensor?, p1: Int) {

            }
        }
        sensorManager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_FASTEST)
    }
}
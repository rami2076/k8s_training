package com.example.kt_sample.echo

import io.github.oshai.kotlinlogging.KotlinLogging.logger
import org.fluentd.logger.FluentLogger
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController


@RestController
class OfficialEchoController {

    companion object {
        private const val PORT = 24224
        private const val HOST = "localhost"
        private val logger: FluentLogger = FluentLogger.getLogger("app.test", HOST, PORT)
    }

    @GetMapping("/echo-official")
    fun echo(): String {

        val data: Map<String, Any> = mapOf(
            "message" to "Hello World",
            "from" to "kt_sample"
        )
        val result = logger.log("official", data)

        return "Hello World $result"
    }
}

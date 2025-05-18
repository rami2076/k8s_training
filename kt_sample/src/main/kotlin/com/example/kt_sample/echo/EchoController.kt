package com.example.kt_sample.echo

import io.github.oshai.kotlinlogging.KotlinLogging
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class EchoController {

    companion object {
        private val logger = KotlinLogging.logger {}
    }

    @GetMapping("/echo")
    fun echo(): String {
        logger.info { "echo" }
        return "Hello World"
    }
}
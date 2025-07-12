package com.cicdpractice;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.time.LocalDateTime;

@RestController
@RequiredArgsConstructor
public class CommonController {

    @GetMapping("/info/version")
    String getVersion() throws IOException {
        return LocalDateTime.now().toString();
    }

}

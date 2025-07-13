package com.cicdpractice;

import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.util.Objects;

@RestController
@RequiredArgsConstructor
public class CommonController {

    @GetMapping("/info/version")
    String getVersion() throws IOException {
        File file = new File(
                        Objects.requireNonNull(this.getClass().getResource("/usr/local/lib/version")).getPath()
        );
        return FileUtils.readFileToString(file, "UTF-8");
    }

}

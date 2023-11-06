package com.chunjae.test06.ctrl;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class HomeController {
    @GetMapping("/")
    public String Home(Model model) {
        return "index";
    }
}

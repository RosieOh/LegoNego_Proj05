package com.chunjae.test06.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntroduceController {
    @GetMapping("/introduce.do")
    public String Home(Model model) {
        return "/main/introduce";
    }
}

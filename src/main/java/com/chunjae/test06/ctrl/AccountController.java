package com.chunjae.test06.ctrl;

import com.chunjae.test06.biz.EmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
public class AccountController {

    private final EmailService emailService;


    @ResponseBody
    @PostMapping("/mail")
    public String MailSend(String mail){

        int number = emailService.sendMail(mail);

        String num = "" + number;

        return num;
    }
}
package com.chunjae.legonego.ctrl;

import com.chunjae.legonego.biz.FaqService;
import com.chunjae.legonego.entity.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/faq/")
public class FaqController {

    @Autowired
    private FaqService faqService;

    @GetMapping("list.do")
    public ModelAndView getFaqList(Model model) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Faq> faqList = faqService.faqList();
        modelAndView.setViewName("/faq/faqList");
        modelAndView.addObject("faqList", faqList);
        return modelAndView;
    }
}
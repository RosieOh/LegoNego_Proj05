package com.legonego.domain.faq.service;

import com.legonego.domain.faq.entity.Faq;
import com.legonego.domain.faq.mapper.FaqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqService {

    @Autowired
    private FaqMapper faqMapper;

    public List<Faq> faqList(){
        return faqMapper.faqList();
    }
}

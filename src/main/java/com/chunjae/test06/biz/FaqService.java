package com.chunjae.test06.biz;

import com.chunjae.test06.entity.Faq;
import com.chunjae.test06.per.FaqMapper;
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

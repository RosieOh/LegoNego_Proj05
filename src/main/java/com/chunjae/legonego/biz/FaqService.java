package com.chunjae.legonego.biz;

import com.chunjae.legonego.entity.Faq;
import com.chunjae.legonego.per.FaqMapper;
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

package com.chunjae.legonego.per;

import com.chunjae.legonego.entity.Faq;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface FaqMapper {
    List<Faq> faqList();
}

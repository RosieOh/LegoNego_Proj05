package com.chunjae.test06.per;

import com.chunjae.test06.entity.Faq;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface FaqMapper {
    List<Faq> faqList();
}

package com.chunjae.legonego.per;

import com.chunjae.legonego.entity.Notice;
import com.chunjae.legonego.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<Notice> noticeList(Page page);
    Notice noticeDetail(int no);
    void visitCount(int no);
    void noticeInsert(Notice domain);
    void noticeDelete(int no);
    void noticeEdit(Notice domain);
    int totalCount(Page page);
}

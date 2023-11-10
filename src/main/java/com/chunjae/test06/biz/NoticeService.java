package com.chunjae.test06.biz;

import com.chunjae.test06.entity.Notice;
import com.chunjae.test06.per.NoticeMapper;
import com.chunjae.test06.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NoticeService {

    public List<Notice> noticeList(Page page) throws Exception;

    public Notice noticeDetail(int no) throws Exception;

    public void noticeInsert(Notice domain) throws Exception;

    public void noticeDelete(int no) throws Exception;

    public void noticeEdit(Notice domain) throws Exception;

    public int totalCount(Page page) throws Exception;
}

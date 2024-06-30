package com.legonego.domain.notice.service;

import com.legonego.domain.notice.entity.Notice;
import com.legonego.global.util.Page;
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

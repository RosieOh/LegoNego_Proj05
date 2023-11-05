package com.chunjae.legonego.biz;

import com.chunjae.legonego.entity.Notice;
import com.chunjae.legonego.util.Page;

import java.util.List;

public interface NoticeService {
    public List<Notice> noticeList(Page page);
    public Notice noticeDetail(int no);
    public void noticeInsert(Notice domain);
    public void noticeDelete(int no);
    public void noticeEdit(Notice domain);
    public int totalCount(Page page);
}

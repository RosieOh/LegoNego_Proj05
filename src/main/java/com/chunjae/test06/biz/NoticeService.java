package com.chunjae.test06.biz;

import com.chunjae.test06.entity.Notice;
import com.chunjae.test06.per.NoticeMapper;
import com.chunjae.test06.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    public List<Notice> noticeList(Page page) {
        return noticeMapper.noticeList(page);
    }

    public Notice noticeDetail(int no) {
        return noticeMapper.noticeDetail(no);
    }

    public void visitCount(int no) {
        noticeMapper.visitCount(no);
    }

    public void noticeInsert(Notice notice) {
        noticeMapper.noticeInsert(notice);
    }

    public void noticeDelete(int no) {
        noticeMapper.noticeDelete(no);
    }

    public void noticeEdit(Notice notice) {
        noticeMapper.noticeEdit(notice);
    }

    public int totalCount(Page page) {
        return noticeMapper.totalCount(page);
    }
}

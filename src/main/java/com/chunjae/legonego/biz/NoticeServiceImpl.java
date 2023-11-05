package com.chunjae.legonego.biz;

import com.chunjae.legonego.entity.Notice;
import com.chunjae.legonego.per.NoticeMapper;
import com.chunjae.legonego.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Notice> noticeList(Page page){
        return noticeMapper.noticeList(page);
    }

    @Override
    public Notice noticeDetail(int no) {
        noticeMapper.visitCount(no);
        return noticeMapper.noticeDetail(no);
    }

    @Override
    public void noticeInsert(Notice domain) {
        noticeMapper.noticeInsert(domain);
    }

    @Override
    public void noticeDelete(int no) {
        noticeMapper.noticeDelete(no);
    }

    @Override
    public void noticeEdit(Notice domain) {
        noticeMapper.noticeEdit(domain);
    }

    @Override
    public int totalCount(Page page) {
        return noticeMapper.totalCount(page);
    }
}

package com.chunjae.test06.biz;

import com.chunjae.test06.entity.Free;
import com.chunjae.test06.entity.Notice;
import com.chunjae.test06.per.FreeMapper;
import com.chunjae.test06.per.NoticeMapper;
import com.chunjae.test06.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeService {

    @Autowired
    private FreeMapper freeMapper;

    public List<Free> freeList(Page page) {
        return freeMapper.freeList(page);
    }

    public Free freeDetail(int fno) {
        return freeMapper.freeDetail(fno);
    }

    public void visitCount(int fno) {
        freeMapper.visitCount(fno);
    }

    public void freeInsert(Free domain) {
        freeMapper.freeInsert(domain);
    }

    public void freeDelete(int fno) {
        freeMapper.freeDelete(fno);
    }

    public void freeEdit(Free domain) {
        freeMapper.freeEdit(domain);
    }

    public int totalCount(Page page) {
        return freeMapper.totalCount(page);
    }
}
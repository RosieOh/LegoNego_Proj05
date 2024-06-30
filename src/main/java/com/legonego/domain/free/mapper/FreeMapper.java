package com.legonego.domain.free.mapper;

import com.legonego.domain.free.entity.Free;
import com.legonego.global.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeMapper {
    List<Free> freeList(Page page);
    Free freeDetail(int fno);
    void visitCount(int fno);
    void freeInsert(Free domain);
    void freeDelete(int fno);
    void freeEdit(Free domain);
    int totalCount(Page page);


}

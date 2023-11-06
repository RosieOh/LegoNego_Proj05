package com.chunjae.legonego.per;

import com.chunjae.legonego.entity.Board;
import com.chunjae.legonego.entity.BoardVO;
import com.chunjae.legonego.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface BoardMapper {
    List<Category> category ();
    List<BoardVO> getBoardList();
    void insertBoard(@Param("board") Board board);
}

package com.chunjae.legonego.biz;

import com.chunjae.legonego.entity.Board;
import com.chunjae.legonego.entity.BoardVO;
import com.chunjae.legonego.entity.Category;
import com.chunjae.legonego.per.BoardMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public List<BoardVO> getBoardList() {
        return boardMapper.getBoardList();
    }
    public void insertBoard(Board board) {
        boardMapper.insertBoard(board);
    };

    public List<Category> getCategoryList() {
        return boardMapper.category();
    }


}

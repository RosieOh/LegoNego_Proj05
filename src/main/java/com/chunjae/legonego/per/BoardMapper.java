package com.chunjae.legonego.per;

import com.chunjae.legonego.entity.Board;
import com.chunjae.legonego.entity.BoardComment;
import com.chunjae.legonego.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<Board> boardList(Page page);
    Board boardDetail(int bno);
    void boardInsert(Board board);
    void boardDelete(int bno);
    void boardEdit(Board board);
    int totalCount(Page page);
    List<BoardComment> boardCommentList(int bno);
    void commentInsert(BoardComment boardComment);
    void commentDelete(int cno);
    List<Board> selectComment();
    List<Board> commentCount();
    List<Board> newBoard();
}

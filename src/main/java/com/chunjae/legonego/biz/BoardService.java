package com.chunjae.legonego.biz;

import com.chunjae.legonego.entity.Board;
import com.chunjae.legonego.entity.BoardComment;
import com.chunjae.legonego.util.Page;

import java.util.List;

public interface BoardService {
    public List<Board> boardList(Page page);
    public Board boardDetail(int bno);
    public void boardInsert(Board board);
    public void boardDelete(int bno);
    public void boardEdit(Board board);
    public int totalCount(Page page);
    public List<BoardComment> boardCommentList(int bno);
    public void commentInsert(BoardComment boardComment);
    public void commentDelete(int cno);
    public List<Board> selectComment();
    public List<Board> commentCount();
    public List<Board> newBoard();
}

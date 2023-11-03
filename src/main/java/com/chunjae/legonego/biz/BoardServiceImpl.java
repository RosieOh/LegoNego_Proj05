package com.chunjae.legonego.biz;

import com.chunjae.legonego.entity.Board;
import com.chunjae.legonego.entity.BoardComment;
import com.chunjae.legonego.per.BoardMapper;
import com.chunjae.legonego.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<Board> boardList(Page page) {
        return boardMapper.boardList(page);
    }

    @Override
    public Board boardDetail(int bno) {
        return boardMapper.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board board) {
        boardMapper.boardInsert(board);
    }

    @Override
    public void boardDelete(int bno) {
        boardMapper.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board board) {
        boardMapper.boardEdit(board);
    }

    @Override
    public int totalCount(Page page) {
        return boardMapper.totalCount(page);
    }

    @Override
    public List<BoardComment> boardCommentList(int bno) {
        return boardMapper.boardCommentList(bno);
    }

    @Override
    public void commentInsert(BoardComment boardComment) {
        boardMapper.commentInsert(boardComment);
    }

    @Override
    public void commentDelete(int cno) {
        boardMapper.commentDelete(cno);
    }

    @Override
    public List<Board> selectComment() {
        return boardMapper.selectComment();
    }

    @Override
    public List<Board> commentCount() {
        return boardMapper.commentCount();
    }

    @Override
    public List<Board> newBoard() {
        return boardMapper.newBoard();
    }
}

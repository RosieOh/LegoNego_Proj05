package com.chunjae.legonego.ctrl;

import com.chunjae.legonego.biz.BoardService;
import com.chunjae.legonego.entity.Board;
import com.chunjae.legonego.entity.BoardVO;
import com.chunjae.legonego.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/board")  // "/board/*"를 "/board"로 변경
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/list")
    public String getBoardList(HttpServletRequest request, Model model){

        String category = request.getParameter("cate");

        // boardlist를 가져오기 위한 메소드 호출
        List<BoardVO> boardlist = boardService.getBoardList();

        // 카테고리 목록을 가져오기 위한 메소드 호출
        List<Category> categoryList = boardService.getCategoryList();

        model.addAttribute("boardlist", boardlist);
        model.addAttribute("category", category);
        model.addAttribute("curCategory", category);

        return "board/boardList";
    }

    @GetMapping("/insert")
    public String boardInsertForm(Model model){
        List<Category> category = boardService.getCategoryList();
        model.addAttribute("category", category);
        return "board/boardInsert";
    }

    @PostMapping("/insert")
    public String boardInsert(Board board){
        boardService.insertBoard(board);
        return "redirect:/board/list";
    }
}

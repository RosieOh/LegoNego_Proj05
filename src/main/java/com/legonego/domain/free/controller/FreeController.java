package com.legonego.domain.free.controller;

import com.legonego.domain.free.entity.Free;
import com.legonego.domain.free.service.FreeService;
import com.legonego.global.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/free/*")
public class FreeController {

    @Autowired
    private FreeService freeService;

    @GetMapping("list.do")
    public String getFreeList(HttpServletRequest httpServletRequest, Model model) throws Exception {
        String type = httpServletRequest.getParameter("type");
        String keyword = httpServletRequest.getParameter("keyword");
        int curPage = httpServletRequest.getParameter("page") != null ? Integer.parseInt(httpServletRequest.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = freeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("total", total);

        List<Free> freeList = freeService.freeList(page);
        model.addAttribute("freeList", freeList);

        return "/free/freeList";
    }

    @GetMapping("detail.do")
    public String getFreeDetail(HttpServletRequest httpServletRequest, Model model) throws Exception {
        int fno = Integer.parseInt(httpServletRequest.getParameter("fno"));
        Free domain = freeService.freeDetail(fno);
        model.addAttribute("domain", domain);
        return "/free/freeList";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest httpServletRequest, Model model) throws Exception {
        String site = httpServletRequest.getParameter("site");
        model.addAttribute("site", site);
        return "/free/freeInsert";
    }

    @PostMapping("insert.do")
    public String freeInsert(HttpServletRequest httpServletRequest, Model model) throws Exception {
        Free domain = new Free();
        domain.setTitle(httpServletRequest.getParameter("title"));
        domain.setContent(httpServletRequest.getParameter("content"));
        freeService.freeInsert(domain);

        // 이거 관리자만 접근가능 하게
        String site = httpServletRequest.getParameter("site");
        if(site.equals("admin")) {
            return "redirect:/free/list.do";
        } else {
            return "redirect:/free/list.do";
        }
    }

    @GetMapping("delete.do")
    public String freeDelete(HttpServletRequest httpServletRequest, Model model) throws Exception {
        int fno = Integer.parseInt(httpServletRequest.getParameter("fno"));
        freeService.freeDelete(fno);
        return "redirect:/free/list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest httpServletRequest, Model model) throws Exception {
        int fno = Integer.parseInt(httpServletRequest.getParameter("fno"));
        Free domain = freeService.freeDetail(fno);
        model.addAttribute("domain", domain);
        return "/free/freeEdit";
    }

    @PostMapping("edit.do")
    public String freeEdit(HttpServletRequest httpServletRequest, Model model) throws Exception {
        int fno = Integer.parseInt(httpServletRequest.getParameter("fno"));
        Free domain = new Free();
        domain.setFno(fno);
        domain.setTitle(httpServletRequest.getParameter("title"));
        domain.setContent(httpServletRequest.getParameter("content"));
        freeService.freeEdit(domain);
        return "redirect:/free/list.do";
    }

    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:" + path);    // 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/team24_war/notice/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value = "ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //서버에 저장된 이미지 경로
        String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
        System.out.println("path:" + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}

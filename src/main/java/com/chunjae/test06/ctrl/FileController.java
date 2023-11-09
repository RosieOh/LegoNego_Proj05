package com.chunjae.test06.ctrl;

import com.chunjae.test06.biz.FileService;
import com.chunjae.test06.entity.FileBoard;
import com.chunjae.test06.entity.FileDTO;
import com.chunjae.test06.entity.FileVO;
import com.chunjae.test06.util.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/file/*")
public class FileController {

    private static final Logger log = LoggerFactory.getLogger(FileController.class);

    // 이거 RootConfig 58번 줄 참고
    @Resource(name="uploadPath")
    String uploadPath;

    @Autowired
    private FileService fileService;

    @Autowired
    HttpSession session;

    @GetMapping("fileupload1.do")
    public String fileUploadForm(){
        return "/file/fileupload";
    }

    // 파일 업로드를 처리하는 POST 메서드. MultipartHttpServletRequest를 이용하여 파일 및 다른 폼 데이터를 처리하고,
    // 업로드된 파일을 서버에 저장하고 파일 정보를 데이터베이스에 저장한 뒤, 파일 목록 페이지로 리다이렉트.
    @PostMapping("fileupload1.do")
    public String fileUpload1(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {

        //파라미터 분리
        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap(); // 맵처리로 반복문 돌려서 이름이랑 값을 분리
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }
        // 파라미터 분리 끝

        //제목 및 내용 분리
        FileBoard board = new FileBoard();
        board.setTitle((String) map.get("title"));
        board.setContent((String) map.get("content"));
        // 제목 내용 끝

        // 톰캣에 저장되는데 이거 해결해야함...
        String devFolder = uploadPath + "/resources/upload";
        String uploadFolder = req.getRealPath("/resources/upload");
        log.info("-----------------------------------");
        log.info(" 현재 프로젝트 홈 : "+req.getContextPath());
        log.info(" dispatcher-servlet에서 지정한 경로 : "+uploadPath);
        log.info(" 요청 URL : "+req.getServletPath());
        log.info(" 프로젝트 저장 경로 : "+req.getRealPath("/resources/upload"));
        //여러 파일 반복 저장
        List<FileDTO> fileList = new ArrayList<>();
        Iterator<String> it = files.getFileNames();
        while(it.hasNext()){
            String paramfName = it.next();
            MultipartFile file = files.getFile(paramfName);
            log.info("-----------------------------------");
            log.info("name : "+file.getOriginalFilename());
            log.info("size : "+file.getSize());
            log.info("path : ");

            File saveFile = new File(uploadFolder, file.getOriginalFilename());
            FileDTO data = new FileDTO();
            data.setSaveFolder(uploadFolder);
            data.setOriginFile(file.getOriginalFilename());
            data.setSaveFile(saveFile.getPath());
            data.setFileSize(file.getSize());
            Date today = new Date();
            data.setUploadDate(today.toString());
            fileList.add(data);
            try {
                file.transferTo(saveFile);  //실제 디렉토리에 파일 저장
            } catch(IllegalStateException e1){
                log.info(e1.getMessage());
            } catch(IOException e2){
                log.info(e2.getMessage());
            }
        }
        // 저장 경로 설정 끝

        // 파일리스트 불러오기
        FileVO fileboard = new FileVO();
        fileboard.setFileList(fileList);
        fileboard.setFileBoard(board);
        fileService.insertFileboard(fileboard);
        return "redirect:list.do";
    }
    // 파일리스트 불러오기 끝

    // 파일 목록을 데이터베이스에서 가져와 뷰에 전달.
    @GetMapping("list.do")
    public String getFileList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = fileService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("total", total);

        List<FileVO> fileboardList = fileService.getFileList(page);
        model.addAttribute("fileboardList", fileboardList);
        return "/file/fileList";
    }

    //특정 파일 정보를 조회
    @GetMapping("getFileboard.do")
    public String getFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        return "/file/getFileboard";
    }

    // 파일을 물리적으로 삭제하고 데이터베이스에서도 해당 파일 정보를 삭제한 후, 파일 목록 페이지로 리다이렉트
    @GetMapping("removeFileboard.do")
    public String removeFileboard(@RequestParam int postNo, HttpServletRequest req) throws Exception {

        String path = req.getRealPath("/resources/upload");
        List<FileDTO> fileList = fileService.getFileGroupList(postNo);
        for(FileDTO fileobj : fileList) {
            File file = new File(path + "/" + fileobj.getOriginFile());
            if (file.exists()) {
                file.delete();
            }
        }

        //데이터베이스에서도 삭제 해줌
        fileService.removeFileboard(postNo);
        return "redirect:list.do";
    }

    // 파일을 물리적으로 삭제하고 데이터베이스에서도 해당 파일 정보를 삭제.
    @PostMapping("fileRemove.do")
    public String fileRemove(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        String path = request.getRealPath("/resources/upload");
        FileDTO fileobj = fileService.getFile(no);
        File file = new File(path + "/" + fileobj.getOriginFile());
        if (file.exists()) {
            file.delete();
        }
        return "/file/getFileboard.do?postNo="+postNo;
    }



    // 파일 수정"만" 보여주는 역할
    @GetMapping("modifyFileboard.do")
    public String modifyFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        model.addAttribute("postNo", postNo);
        return "/file/modifyFileboard";
    }

    // fileupload 참고
    @PostMapping("modifyFileboard.do")
    public String modifyFileboard(@RequestParam(required = true) int postNo, MultipartHttpServletRequest files, HttpServletRequest req,Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
            System.out.println("map : "+map.toString());
        }
        //제목 및 내용 분리
        FileBoard board = new FileBoard();
        board.setPostNo(postNo);
        board.setTitle((String) map.get("title"));
        board.setContent((String) map.get("content"));
        req.getRealPath("/resources/upload");
        String devFolder = uploadPath + "/resources/upload/";


        String uploadFolder = req.getRealPath("/resources/upload");
        log.info("-----------------------------------");
        log.info(" 현재 프로젝트 홈 : "+req.getContextPath());
        log.info(" dispatcher-servlet에서 지정한 경로 : "+uploadPath);
        log.info(" 요청 URL : "+req.getServletPath());
        log.info(" 프로젝트 저장 경로 : "+req.getRealPath("/resources/upload"));
        List<FileDTO> fileList = new ArrayList<>();
        Iterator<String> it = files.getFileNames();

        while(it.hasNext()){
            String paramfName = it.next();
            MultipartFile file = files.getFile(paramfName);
            log.info("-----------------------------------");
            log.info("name : "+file.getOriginalFilename());
            log.info("size : "+file.getSize());
            log.info("path : ");

            File saveFile = new File(uploadFolder, file.getOriginalFilename());
            FileDTO data = new FileDTO();
            data.setSaveFolder(uploadFolder);
            data.setOriginFile(file.getOriginalFilename());
            data.setSaveFile(saveFile.getPath());
            data.setFileSize(file.getSize());
            Date today = new Date();
            data.setUploadDate(today.toString());
            data.setPostNo(postNo);
            fileList.add(data);
            try {
                file.transferTo(saveFile);
            } catch(IllegalStateException e1){
                log.info(e1.getMessage());
            } catch(IOException e2){
                log.info(e2.getMessage());
            }
            if (!file.getOriginalFilename().equals("")) {
                fileService.removeAllFile(postNo);
            }
        }
        fileboard.setFileList(fileList);
        fileboard.setFileBoard(board);
        fileService.editFileboard(fileboard);

        return "redirect:getFileboard.do?postNo="+postNo;
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
            String path = "C:\\Users\\db400tea\\Desktop\\10251416\\team24\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:" + path);
            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs();
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush();

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
        String path = "C:\\Users\\db400tea\\Desktop\\10251416\\team24\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
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
package com.sist.model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.util.*;

import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CocktailDAO;
import com.sist.dao.CocktailbarDAO;
import com.sist.dao.CommunityDAO;
import com.sist.vo.CocktailVO;
import com.sist.vo.CocktailbarVO;
import com.sist.vo.CommunityFreeboardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CommunityModel {
	private final String uploadPath = "./upload/";
	
	@RequestMapping("community/freeboard_list.do")
	public String freeboard_list(HttpServletRequest request, HttpServletResponse response)
	{	
		try {
			//1. 사용자 요청 => page
			String page=request.getParameter("page");
			if(page==null)
				page="1"; // default page
			
			// 현재 페이지 지정
			int curpage=Integer.parseInt(page);
			// 데이터 읽기
			Map map=new HashMap();
			
			map.put("start", (curpage*20)-19);
			map.put("end", curpage*20);
			List<CommunityFreeboardVO> list=CommunityDAO.boardListData(map);
			int totalpage=CommunityDAO.boardTotalPage();
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			if(endPage>totalpage)
				endPage=totalpage;
			
			// list.jsp로 값 전송
			request.setAttribute("list", list);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("page", page);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		request.setAttribute("main_jsp", "../community/freeboard_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("community/freeboard_insert_newpost.do")
	public String freeboard_insertNewPost(HttpServletRequest request, HttpServletResponse response)
	{	
		
		CommunityFreeboardVO tempVO = new CommunityFreeboardVO();
		
		//board_no,id,subject,tag,htmlfile,poststate
		tempVO.setSubject("temppost");
		tempVO.setTag("temppost");
		tempVO.setHtmlfile("temppost");
		tempVO.setPostState("UNSAVED");
		
		CommunityDAO.boardInsertNewPost(tempVO);
		request.setAttribute("temp_board_no", tempVO.getBoard_no());
		request.setAttribute("main_jsp", "../community/freeboard_insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("community/freeboard_insert.do")
	public String freeboard_insert(HttpServletRequest request, HttpServletResponse response)
	{	
		
		// 게시물 삭제 url 이상한거 고치기
		// 게시물 시간 표시 고치기
		//quill 게시물 내용 길면 확장되도록 바꾸기
		if (JakartaServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
            JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
            upload.setFileSizeMax(20971520);
            upload.setSizeMax(20971520);
            
            try {
            	
            	//폴더 생성하면 이클립스 폴더 안에 upload 폴더 생성됨
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
            	
                String board_no ="";
                String id = "";
                String tag="";
                String subject="";
            	//request객체를 이 코드 앞에서 사용하고 있으면 여기 리스트에 데이터 안들어감
                List<FileItem> formItems = upload.parseRequest(request);
                Charset charset = Charset.forName("UTF-8");
                Map map = new HashMap();
                if (formItems != null /*&& formItems.size() > 0*/) {
                    for (FileItem item : formItems) {
                        if (!item.isFormField()) {
                            String fileName = new File(item.getName()).getName();
                            String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
                            //추후에 db insert
                            UUID uuid = UUID.randomUUID();
                            fileName=uuid.toString()+extension;
                            item.write(Path.of(uploadPath, fileName));
                            map.put("htmlfile_size", item.getSize());
                    		map.put("htmlfile",fileName);
                        }
                        else
                        {
                        	String fieldName = item.getFieldName();
                            String fieldValue = item.getString(charset);  // 텍스트 값
                            System.out.println(fieldName+":"+fieldValue);
                        	map.put(fieldName, fieldValue);
                        }
                    }
                }
                
                
                CommunityDAO.boardInsert(map);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
		
		request.setAttribute("main_jsp", "../community/freeboard_insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("community/freeboard_delete_unsaved.do")
	public void freeboard_delete_unsaved(HttpServletRequest request, HttpServletResponse response)
	{	
		String board_no = request.getParameter("board_no");
		CommunityDAO.boardDeleteUnsaved(Integer.parseInt(board_no));
		//delete cascade 제약조건으로 게시물 삭제시 이미지 자동 삭제
	}
	@RequestMapping("community/freeboard_detail.do")
	public String freeboard_detail(HttpServletRequest request, HttpServletResponse response)
	{	
		
		try {
			String no=request.getParameter("board_no");
			String page=request.getParameter("page");
			CommunityFreeboardVO vo=CommunityDAO.boardDetailData(Integer.parseInt(no));
			request.setAttribute("vo", vo);
			request.setAttribute("page", page);
			request.setAttribute("main_jsp", "../community/freeboard_detail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "../main/main.jsp";
	}
	
	@RequestMapping("community/image_convert.do")// 이미지 저장후 이미지 이름 반환
	public void image_convert(HttpServletRequest request, HttpServletResponse response)
	{

		if (JakartaServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
            JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
            upload.setFileSizeMax(20971520);
            upload.setSizeMax(20971520);

            try {
            	//폴더 생성하면 이클립스 폴더 안에 upload 폴더 생성됨
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
            	
                String postId ="";//이미지를 가지고 있는 게시물 아이디
            	//request객체를 이 코드 앞에서 사용하고 있으면 여기 리스트에 데이터 안들어감
                List<FileItem> formItems = upload.parseRequest(request);
                Map map = new HashMap();
                if (formItems != null /*&& formItems.size() > 0*/) {
                    for (FileItem item : formItems) {
                        if (!item.isFormField()) {
                            String fileName = new File(item.getName()).getName();
                            String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
                            //추후에 db insert
                            UUID uuid = UUID.randomUUID();
                            fileName=uuid.toString()+extension;
                            item.write(Path.of(uploadPath, fileName));
                            map.put("file_size", item.getSize());
                            JSONObject obj=new JSONObject();
                    		obj.put("imageName", fileName);
                    		map.put("file_name",fileName);
                    		response.setContentType("application/x-json; charset=utf-8");
                            response.getWriter().print(obj);
                        }
                        else
                        {
                        	postId = item.getString();
                        	map.put("board_no", postId);
                        }
                    }
                }
                
                
                CommunityDAO.boardInsertImage(map);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
		
	}
	
	@RequestMapping("community/get_htmlfile.do")//html파일 링크 리턴
	public void get_htmlfile(HttpServletRequest request, HttpServletResponse response)
	{
		String fileName = request.getParameter("htmlfile");
		try {
			File file=new File(uploadPath+fileName);
			
			response.addHeader("Accept-Ranges", "bytes");
			response.setContentLength((int) file.length());
			response.setContentType("text/html; charset=UTF-8");
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

			byte b[] = new byte[(int) file.length()];

			int read = 0;
			while ((read = bis.read(b)) != -1) {
				bos.write(b, 0, read);
			}
			   
			bos.flush();
			   
			bos.close();
			bis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("community/get_converted_image.do")//이미지파일 링크 리턴
	public void get_converted_image(HttpServletRequest request, HttpServletResponse response)
	{
		String fileName = request.getParameter("image");
		try {
			File file=new File(uploadPath+fileName);
			
			response.addHeader("Accept-Ranges", "bytes");
			response.setContentLength((int) file.length());
			response.setContentType("image/png");
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

			byte b[] = new byte[(int) file.length()];

			int read = 0;
			while ((read = bis.read(b)) != -1) {
				bos.write(b, 0, read);
			}
			   
			bos.flush();
			   
			bos.close();
			bis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("community/delete_image.do")//이미지파일 삭제
	public void delete_image(HttpServletRequest request, HttpServletResponse response)
	{
		
		String[] imageNames = ((String)request.getParameter("imageNames")).split(",");
		try {
			
			for(String imageName:imageNames)
			{
				File file=new File(uploadPath+imageName);
				file.delete();
			}
			CommunityDAO.boardDeleteImage(imageNames);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

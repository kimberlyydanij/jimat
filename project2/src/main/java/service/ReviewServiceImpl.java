package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import dao.ReviewDAO;
import dto.PageDTO;
import dto.ReviewDTO;

public class ReviewServiceImpl implements ReviewService{

	private ReviewDAO dao;
	
	public ReviewServiceImpl() {

	}
	
	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	} 

	@Override
	public List<ReviewDTO> find_review_allProcess() {
		return dao.find_review_all();
	}

	@Override
	public List<ReviewDTO> find_review_userProcess(String review_user_id) {
		return dao.find_review_user(review_user_id);
	}

	@Override
	public ReviewDTO find_review_numberProcess(int review_seq) {
		return dao.find_review_number(review_seq);
	}

	@Override
	public void review_writeProcess(ReviewDTO dto) {
		dao.review_write(dto);
	}

	@Override
	public void review_updateProcess(ReviewDTO dto, String urlpath) {
		String filename = dto.getReview_upload();
		
		//수정한 파일 있으면
		if(filename != null) {
			String path = dao.review_upload(dto.getReview_seq());
			
			//기존 첨부파일이 있으면
			if(path != null) {
				File file = new File(urlpath, path);
				file.delete();
			}
		}
		dao.review_update(dto);
	}

	@Override
	public void review_deleteProcess(int review_seq, String urlpath) {
		String path = dao.review_upload(review_seq);
		
		//num컬럼에 해당하는 첨부파일이 있으면
		if(path!=null) {
			File file = new File(urlpath, path);
			file.delete();
		}
		
		dao.review_delete(review_seq);
	}

	@Override
	public List<ReviewDTO> find_review_pageProcess(int review_foodstore_seq) {
		return dao.find_review_page(review_foodstore_seq);
	}

	@Override
	public int countProcess(int review_foodstore_seq) {
		return dao.count(review_foodstore_seq);
	}

	@Override
	public List<ReviewDTO> listProcess(int startRow, int endRow, int review_foodstore_seq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("review_foodstore_seq", review_foodstore_seq);
		
		return dao.list(map);
	}


	
	
}

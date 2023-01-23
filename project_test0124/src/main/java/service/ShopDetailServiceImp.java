package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import dao.ShopDetailDAO;
import dto.ReviewDTO;
import dto.ShopDetailDTO;

public class ShopDetailServiceImp implements ShopDetailService {
	
	
	private ShopDetailDAO sdao;
	
	public ShopDetailServiceImp() {
	
	}
	
	public void setSdao(ShopDetailDAO sdao) {
		this.sdao = sdao;
	}

	@Override
	public List<ShopDetailDTO> getShopDetailData(ShopDetailDTO sdto) {
	
		return null;
	}
	
	@Override
	public ShopDetailDTO shopDetailData(String number) {

		return sdao.shopDetailData(number);
	}

	@Override
	public List<ReviewDTO> find_review_allProcess() {
		return sdao.find_review_all();
	}

	@Override
	public List<ReviewDTO> find_review_userProcess(String review_user_id) {
		return sdao.find_review_user(review_user_id);
	}

	@Override
	public ReviewDTO find_review_numberProcess(int review_seq) {
		return sdao.find_review_number(review_seq);
	}

	@Override
	public void review_writeProcess(ReviewDTO dto) {
		sdao.review_write(dto);
	}

	@Override
	public void review_updateProcess(ReviewDTO dto, String urlpath) {
		String filename = dto.getReview_upload();
		
		//수정한 파일 있으면
		if(filename != null) {
			String path = sdao.review_upload(dto.getReview_seq());
			System.out.println("path : " + path);
			//기존 첨부파일이 있으면
			if(path != null) {
				File file = new File(urlpath, path);
				file.delete();
			}
		}
		sdao.review_update(dto);
	}

	@Override
	public void review_deleteProcess(int review_seq, String urlpath) {
		String path = sdao.review_upload(review_seq);
		
		//num컬럼에 해당하는 첨부파일이 있으면
		if(path!=null) {
			File file = new File(urlpath, path);
			file.delete();
		}
		
		sdao.review_delete(review_seq);
	}

	@Override
	public List<ReviewDTO> find_review_pageProcess(String review_foodstore_seq) {
		return sdao.find_review_page(review_foodstore_seq);
	}

	@Override
	public int countProcess(String review_foodstore_seq) {
		return sdao.count(review_foodstore_seq);
	}

	@Override
	public List<ReviewDTO> listProcess(int startRow, int endRow, String review_foodstore_seq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("review_foodstore_seq", review_foodstore_seq);
		
		return sdao.list(map);
	}

	@Override
	public String review_imageProcess(String review_writer_id) {
		return sdao.review_image(review_writer_id);
	}

}	
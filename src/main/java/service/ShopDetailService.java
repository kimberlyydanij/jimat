package service;

import java.util.List;

import dto.ReviewDTO;
import dto.ShopDetailDTO;

public interface ShopDetailService {

	public List<ShopDetailDTO> getShopDetailData(ShopDetailDTO sdto);
	
	public ShopDetailDTO shopDetailData(String number);
	
	public int countProcess(String review_foodstore_seq);
	
	public List<ReviewDTO> listProcess(int startRow, int endRow, String review_foodstore_seq);
	
	public List<ReviewDTO> find_review_allProcess();
	
	public List<ReviewDTO> find_review_userProcess(String review_user_id);
	
	public ReviewDTO find_review_numberProcess(int review_seq);
	
	public List<ReviewDTO> find_review_pageProcess(String review_foodstore_seq);
	
	public void review_writeProcess(ReviewDTO dto);
	
	public void review_updateProcess(ReviewDTO dto, String urlpath);
	
	public void review_deleteProcess(int review_seq, String urlpath);
	
	public String review_imageProcess(String review_writer_id);
}

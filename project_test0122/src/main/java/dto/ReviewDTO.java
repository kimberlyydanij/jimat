package dto;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {

	private int review_seq;
	private String review_writer_id;
	private String review_write_date;
	private String review_content;
	private String review_foodstore_seq;
	private String review_tag;
	private int review_rating;
	private String review_upload;
	
	private MultipartFile filename;
	
	public ReviewDTO() {

	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public String getReview_writer_id() {
		return review_writer_id;
	}

	public void setReview_writer_id(String review_writer_id) {
		this.review_writer_id = review_writer_id;
	}

	public String getReview_write_date() {
		return review_write_date;
	}

	public void setReview_write_date(String review_write_date) {
		this.review_write_date = review_write_date;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_foodstore_seq() {
		return review_foodstore_seq;
	}

	public void setReview_foodstore_seq(String review_foodstore_seq) {
		this.review_foodstore_seq = review_foodstore_seq;
	}

	public String getReview_upload() {
		return review_upload;
	}

	public void setReview_upload(String review_upload) {
		this.review_upload = review_upload;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public String getReview_tag() {
		return review_tag;
	}

	public void setReview_tag(String review_tag) {
		this.review_tag = review_tag;
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	
	
}

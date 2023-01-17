package dto;

public class ReviewDTO {

	private int review_seq;
	private String review_writer_id;
	private String review_write_date;
	private String review_content;
	private int review_foodstore_seq;
	private int review_good_number;
	
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

	public int getReview_foodstore_seq() {
		return review_foodstore_seq;
	}

	public void setReview_foodstore_seq(int review_foodstore_seq) {
		this.review_foodstore_seq = review_foodstore_seq;
	}

	public int getReview_good_number() {
		return review_good_number;
	}

	public void setReview_good_number(int review_good_number) {
		this.review_good_number = review_good_number;
	}

	
	
}

package dto;

public class ReviewLikeDTO {

	private int review_like_seq;
	private String review_like_user_id;
	private int review_like_review_seq;
	private String review_like_store_id;
	private int review_like_click;

	public ReviewLikeDTO() {
	}

	public int getReview_like_seq() {
		return review_like_seq;
	}

	public void setReview_like_seq(int review_like_seq) {
		this.review_like_seq = review_like_seq;
	}

	public String getReview_like_user_id() {
		return review_like_user_id;
	}

	public void setReview_like_user_id(String review_like_user_id) {
		this.review_like_user_id = review_like_user_id;
	}

	public int getReview_like_review_seq() {
		return review_like_review_seq;
	}

	public void setReview_like_review_seq(int review_like_review_seq) {
		this.review_like_review_seq = review_like_review_seq;
	}

	public String getReview_like_store_id() {
		return review_like_store_id;
	}

	public void setReview_like_store_id(String review_like_store_id) {
		this.review_like_store_id = review_like_store_id;
	}

	public int getReview_like_click() {
		return review_like_click;
	}

	public void setReview_like_click(int review_like_click) {
		this.review_like_click = review_like_click;
	}

	
}

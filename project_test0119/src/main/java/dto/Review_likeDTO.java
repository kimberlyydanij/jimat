package dto;

public class Review_likeDTO {

	private int review_like_seq;
	private String review_like_user_id;
	private int review_like_review_seq;

	public Review_likeDTO() {
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


}

package com.sist.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Review;
import com.sist.web.model.ReviewImg;

@Repository("reviewDao")
public interface ReviewDao {
	public int reviewInsert(Review review);

	public List<Review> reviewListSelect(String prodId);

	public long ratingAvg(String prodId);

	public long reviewCount(String prodId);

	public int reviewImgInsert(ReviewImg reviewImg);

	public int reviewDelete(Review review);

	public int reviewUpdate(Review review);

	public int reviewImgDelete(ReviewImg reviewImg);

	public Review reviewSelect(long reviewSeq);

	public long getReviewSeq();

	public List<ReviewImg> reviewImgSelect(long reviewSeq);
}
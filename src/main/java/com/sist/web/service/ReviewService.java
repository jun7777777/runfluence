package com.sist.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.common.util.FileUtil;
import com.sist.web.dao.ReviewDao;
import com.sist.web.model.Review;
import com.sist.web.model.ReviewImg;

@Service("reviewService")
public class ReviewService {
	public static Logger logger = LoggerFactory.getLogger(ReviewService.class);

	@Autowired
	private ReviewDao reviewDao;

	@Value("#{env['review.img.dir']}")
	private String REVIEW_IMG_DIR;

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int reviewInsert(Review review) throws Exception {
		int count = 0;

		count = reviewDao.reviewInsert(review);

		if (count > 0 && review.getReviewImg() != null) {
			for (int i = 0; i < review.getReviewImg().size(); i++) {
				ReviewImg reviewImg = review.getReviewImg().get(i);
				reviewImg.setReviewSeq(review.getReviewSeq());

				reviewDao.reviewImgInsert(reviewImg);
			}

		}

		return count;
	}

	public List<Review> reviewListSelect(String prodId) {
		List<Review> list = null;

		try {
			list = reviewDao.reviewListSelect(prodId);
		}

		catch (Exception e) {
			logger.error("[ReviewService] reviewListSelect Exception", e);
		}

		return list;
	}

	public long ratingAvg(String prodId) {
		long avg = 0;

		try {
			avg = reviewDao.ratingAvg(prodId);
		}

		catch (Exception e) {
			logger.error("[ReviewService] ratingAvg Exception", e);
		}

		return avg;
	}

	public long reviewCount(String prodId) {
		long count = 0;

		try {
			count = reviewDao.reviewCount(prodId);
		}

		catch (Exception e) {
			logger.error("[ReviewService] reviewCount Exception", e);
		}

		return count;
	}

	public int reviewDelete(Review review) {
		int count = 0;

		try {
			count = reviewDao.reviewDelete(review);
		}

		catch (Exception e) {
			logger.error("[ReviewService] reviewDelete Exception", e);
		}

		return count;
	}

	public Review reviewSelect(long reviewSeq) {
		Review review = null;

		try {
			review = reviewDao.reviewSelect(reviewSeq);
		}

		catch (Exception e) {
			logger.error("[ReviewService] reviewSelect Exception", e);
		}

		return review;
	}

	public long getReviewSeq() {
		long count = 0;

		try {
			count = reviewDao.getReviewSeq();
		}

		catch (Exception e) {
			logger.error("[ReviewService] getReviewSeq Exception", e);
		}

		return count;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int reviewUpdate(Review review) throws Exception {
      int count = 0;

      count = reviewDao.reviewUpdate(review);

      List<ReviewImg> delreviewImg = reviewDao.reviewImgSelect(review.getReviewSeq());

      if (count > 0 && delreviewImg != null) {
         for (int i = 0; i < delreviewImg.size(); i++) {
            FileUtil.deleteFile(
                  REVIEW_IMG_DIR + FileUtil.getFileSeparator() + delreviewImg.get(i).getReviewImgName());
            reviewDao.reviewImgDelete(delreviewImg.get(i));
         }
         
         if (review.getReviewImg() != null) {//
            for (int i = 0; i < review.getReviewImg().size(); i++) {
               ReviewImg reviewImg = review.getReviewImg().get(i);
               reviewImg.setReviewSeq(review.getReviewSeq());
   
               reviewDao.reviewImgInsert(reviewImg);
            }
         }
      }

      return count;
   }
}
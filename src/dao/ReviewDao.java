package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.ReviewDto;

public class ReviewDao {
private static ReviewDao dao = new ReviewDao();
	
	private ReviewDao() {
		DBConnection.initConnection();
	}
	
	public static ReviewDao getInstance() {
		return dao;
	}
	
	public void addReview(List<ReviewDto> list) {

		
	}
}

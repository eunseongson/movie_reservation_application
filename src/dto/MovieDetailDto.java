package dto;

import java.util.List;

public class MovieDetailDto {
	private String seq;
	private String title;
	private String rowtitle;
	private String reservation;
	private String img;
	private String background_poster;
	private String rdate;
	private String readcount;
	private String actor;
	private String author;
	private String genre;
	private String age_limit;
	private String running_time;
	private String country;
	private String movie_description;
	private String movie_description_title;
	private String previous_expectations;
	private String real_review;
	private List<String> still_cut;
	private List<ReviewDto> reviews;

	public MovieDetailDto() {
		super();
	}

	public MovieDetailDto(String seq, String title, String rowtitle, String reservation, String img, String background_poster, String rdate, String readcount, String actor,
			String author, String genre, String age_limit, String running_time, String country,
			String movie_description, String movie_description_title, String previous_expectations, String real_review,
			List<String> still_cut, List<ReviewDto> reviews) {
		super();
		this.seq = seq;
		this.title = title;
		this.rowtitle = rowtitle;
		this.reservation = reservation;
		this.img = img;
		this.background_poster = background_poster;
		this.rdate = rdate;
		this.readcount = readcount;
		this.actor = actor;
		this.author = author;
		this.genre = genre;
		this.age_limit = age_limit;
		this.running_time = running_time;
		this.country = country;
		this.movie_description = movie_description;
		this.movie_description_title = movie_description_title;
		this.previous_expectations = previous_expectations;
		this.real_review = real_review;
		this.still_cut = still_cut;
		this.reviews = reviews;
	}

//	public MovieDetailDto(String title, String rowtitle, String reservation, String img, String rdate, String readcount, String actor,
//			String author, String genre, String age_limit, String running_time, String country,
//			String movie_description, String movie_description_title, String previous_expectations, String real_review,
//			List<String> still_cut, List<ReviewDto> reviews) {
//		super();
//		this.title = title;
//		this.rowtitle = rowtitle;
//		this.reservation = reservation;
//		this.img = img;
//		this.rdate = rdate;
//		this.readcount = readcount;
//		this.actor = actor;
//		this.author = author;
//		this.genre = genre;
//		this.age_limit = age_limit;
//		this.running_time = running_time;
//		this.country = country;
//		this.movie_description = movie_description;
//		this.movie_description_title = movie_description_title;
//		this.previous_expectations = previous_expectations;
//		this.real_review = real_review;
//		this.still_cut = still_cut;
//		this.reviews = reviews;
//	}
	

	public MovieDetailDto(String title, String rowtitle, String reservation, String img, String background_poster,
			String rdate, String readcount, String actor, String author, String genre, String age_limit,
			String running_time, String country, String movie_description, String movie_description_title,
			String previous_expectations, String real_review, List<String> still_cut, List<ReviewDto> reviews) {
		super();
		this.title = title;
		this.rowtitle = rowtitle;
		this.reservation = reservation;
		this.img = img;
		this.background_poster = background_poster;
		this.rdate = rdate;
		this.readcount = readcount;
		this.actor = actor;
		this.author = author;
		this.genre = genre;
		this.age_limit = age_limit;
		this.running_time = running_time;
		this.country = country;
		this.movie_description = movie_description;
		this.movie_description_title = movie_description_title;
		this.previous_expectations = previous_expectations;
		this.real_review = real_review;
		this.still_cut = still_cut;
		this.reviews = reviews;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}
	
	public String getRowTitle() {
		return rowtitle;
	}

	public List<String> getStill_cut() {
		return still_cut;
	}

	public void setStill_cut(List<String> still_cut) {
		this.still_cut = still_cut;
	}

	public List<ReviewDto> getReviews() {
		return reviews;
	}

	public void setReviews(List<ReviewDto> reviews) {
		this.reviews = reviews;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReservation() {
		return reservation;
	}

	public void setReservation(String reservation) {
		this.reservation = reservation;
	}

	public String getImg() {
		return img;
	}
	
	public String getBackgroundPoster() {
		return background_poster;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getAge_limit() {
		return age_limit;
	}

	public void setAge_limit(String age_limit) {
		this.age_limit = age_limit;
	}

	public String getRunning_time() {
		return running_time;
	}

	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMovie_description() {
		return movie_description;
	}

	public void setMovie_description(String movie_description) {
		this.movie_description = movie_description;
	}

	public String getMovie_description_title() {
		return movie_description_title;
	}

	public void setMovie_description_title(String movie_description_title) {
		this.movie_description_title = movie_description_title;
	}

	public String getPrevious_expectations() {
		return previous_expectations;
	}

	public void setPrevious_expectations(String previous_expectations) {
		this.previous_expectations = previous_expectations;
	}

	public String getReal_review() {
		return real_review;
	}

	public void setReal_review(String real_review) {
		this.real_review = real_review;
	}

}

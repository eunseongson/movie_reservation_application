package dto;

public class MovieDetailDto {
	private int seq;
	private String title;
	private int reservation;
	private String img;
	private String rdate;
	private int readcount;
	private String actor;
	private String author;
	private String genre;
	private String age_limit;
	private String country;
	private String movie_description;
	private int previous_expectations;
	private int real_review;
	
	public MovieDetailDto() {
		super();
	}
	
	public MovieDetailDto(String title, int reservation, String img, String rdate, int readcount, String actor,
			String author, String genre, String age_limit, String country, String movie_description,
			int previous_expectations, int real_review) {
		super();
		this.title = title;
		this.reservation = reservation;
		this.img = img;
		this.rdate = rdate;
		this.readcount = readcount;
		this.actor = actor;
		this.author = author;
		this.genre = genre;
		this.age_limit = age_limit;
		this.country = country;
		this.movie_description = movie_description;
		this.previous_expectations = previous_expectations;
		this.real_review = real_review;
	}

	public MovieDetailDto(int seq, String title, int reservation, String img, String rdate, int readcount,
			String actor, String author, String genre, String age_limit, String country, String movie_description,
			int previous_expectations, int real_review) {

		this.seq = seq;
		this.title = title;
		this.reservation = reservation;
		this.img = img;
		this.rdate = rdate;
		this.readcount = readcount;
		this.actor = actor;
		this.author = author;
		this.genre = genre;
		this.age_limit = age_limit;
		this.country = country;
		this.movie_description = movie_description;
		this.previous_expectations = previous_expectations;
		this.real_review = real_review;
	}
	
	public int getSeq() {
		return seq;
	}
	public String getTitle() {
		return title;
	}
	public int getReservation() {
		return reservation;
	}
	public String getImg() {
		return img;
	}
	public String getRdate() {
		return rdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public String getActor() {
		return actor;
	}
	public String getAuthor() {
		return author;
	}
	public String getGenre() {
		return genre;
	}
	public String getAge_limit() {
		return age_limit;
	}
	public String getCountry() {
		return country;
	}
	public String getMovie_description() {
		return movie_description;
	}
	public int getPrevious_expectations() {
		return previous_expectations;
	}
	public int getReal_review() {
		return real_review;
	}
	
	
	
}

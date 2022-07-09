package dto;

public class ReviewDto {
	private int movie_seq;
	private String title;
	private String content;
	private String wdate;
	
	public ReviewDto(int movie_seq, String title, String content, String wdate) {
		super();
		this.movie_seq = movie_seq;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
	}
	public int getMovie_seq() {
		return movie_seq;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getWdate() {
		return wdate;
	}
}
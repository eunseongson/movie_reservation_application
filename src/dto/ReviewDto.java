package dto;

public class ReviewDto {
	private String title;
	private String content;
	private String wdate;

	public ReviewDto() {
		super();
	}

	public ReviewDto(String title, String content, String wdate) {
		super();

		this.title = title;
		this.content = content;
		this.wdate = wdate;
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

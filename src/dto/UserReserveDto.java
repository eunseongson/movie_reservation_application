package dto;

public class UserReserveDto {
	
	private String title;
	private String city;
	private String rdate;
	private String wdate;
	
	public UserReserveDto() {
	}

	public UserReserveDto(String title, String city, String wdate, String rdate) {
		this.title = title;
		this.city = city;
		this.wdate = wdate;
		this.rdate = rdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "UserReserveDto [title=" + title + ", city=" + city + ", wdate=" + wdate + ", rdate=" + rdate + "]";
	}
}

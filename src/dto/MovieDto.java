package dto;

public class MovieDto {
	private String title;
	private double reservation;
	private String img;
	private String rdate;
	public MovieDto(String title, double reservation, String img, String rdate) {
		super();
		this.title = title;
		this.reservation = reservation;
		this.img = img;
		this.rdate = rdate;
	}
	public String getTitle() {
		return title;
	}
	public double getReservation() {
		return reservation;
	}
	public String getImg() {
		return img;
	}
	public String getRdate() {
		return rdate;
	}
	
}

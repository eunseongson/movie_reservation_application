package dto;

public class MovieDto {

   private String title;
   private String rowtitle;
   private double reservation;
   private String img;
   private String rdate;
   
   public MovieDto() {
	   }
   
   public MovieDto(String title, String rowtitle, double reservation, String img, String rdate) {
      super();
      this.title = title;
      this.rowtitle = rowtitle;
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

   public String getRowtitle() {
		return rowtitle;
   }

	@Override
	public String toString() {
		return "MovieDto [title=" + title + ", rowtitle=" + rowtitle + ", reservation=" + reservation + ", img=" + img
				+ ", rdate=" + rdate + "]";
	}
   
   
	
}
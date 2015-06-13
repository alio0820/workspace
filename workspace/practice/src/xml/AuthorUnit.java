package xml;

public class AuthorUnit {
	/*
	 * 作者和作者单位的bean类
	 */
	private int id;
	private String author;
	private String author_unit;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getAuthor_unit() {
		return author_unit;
	}
	public void setAuthor_unit(String authorUnit) {
		author_unit = authorUnit;
	}
	
}

package com;

/**
 * ReaderId entity. @author MyEclipse Persistence Tools
 */

public class ReaderId implements java.io.Serializable {

	// Fields

	private Short readerId;
	private String company;
	private String name;
	private String sex;
	private String grade;
	private String addr;

	// Constructors

	/** default constructor */
	public ReaderId() {
	}

	/** full constructor */
	public ReaderId(Short readerId, String company, String name, String sex,
			String grade, String addr) {
		this.readerId = readerId;
		this.company = company;
		this.name = name;
		this.sex = sex;
		this.grade = grade;
		this.addr = addr;
	}

	// Property accessors

	public Short getReaderId() {
		return this.readerId;
	}

	public void setReaderId(Short readerId) {
		this.readerId = readerId;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ReaderId))
			return false;
		ReaderId castOther = (ReaderId) other;

		return ((this.getReaderId() == castOther.getReaderId()) || (this
				.getReaderId() != null
				&& castOther.getReaderId() != null && this.getReaderId()
				.equals(castOther.getReaderId())))
				&& ((this.getCompany() == castOther.getCompany()) || (this
						.getCompany() != null
						&& castOther.getCompany() != null && this.getCompany()
						.equals(castOther.getCompany())))
				&& ((this.getName() == castOther.getName()) || (this.getName() != null
						&& castOther.getName() != null && this.getName()
						.equals(castOther.getName())))
				&& ((this.getSex() == castOther.getSex()) || (this.getSex() != null
						&& castOther.getSex() != null && this.getSex().equals(
						castOther.getSex())))
				&& ((this.getGrade() == castOther.getGrade()) || (this
						.getGrade() != null
						&& castOther.getGrade() != null && this.getGrade()
						.equals(castOther.getGrade())))
				&& ((this.getAddr() == castOther.getAddr()) || (this.getAddr() != null
						&& castOther.getAddr() != null && this.getAddr()
						.equals(castOther.getAddr())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getReaderId() == null ? 0 : this.getReaderId().hashCode());
		result = 37 * result
				+ (getCompany() == null ? 0 : this.getCompany().hashCode());
		result = 37 * result
				+ (getName() == null ? 0 : this.getName().hashCode());
		result = 37 * result
				+ (getSex() == null ? 0 : this.getSex().hashCode());
		result = 37 * result
				+ (getGrade() == null ? 0 : this.getGrade().hashCode());
		result = 37 * result
				+ (getAddr() == null ? 0 : this.getAddr().hashCode());
		return result;
	}

}
package com.banking.entity;

public class goiVay {
	private Integer ID;
	private String tenGoi;
	private float laiSuat;
	private loaiGoiVay loaiGoiVay;
	
	@Override
	public String toString() {
		return "goiVay [ID=" + ID + ", tenGoi=" + tenGoi + ", laiSuat=" + laiSuat + ", loaiGoiVay=" + loaiGoiVay + "]";
	}
	public goiVay() {
		super();
	}
	public goiVay(Integer iD, String tenGoi, float laiSuat, com.banking.entity.loaiGoiVay loaiGoiVay) {
		super();
		ID = iD;
		this.tenGoi = tenGoi;
		this.laiSuat = laiSuat;
		this.loaiGoiVay = loaiGoiVay;
	}
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getTenGoi() {
		return tenGoi;
	}
	public void setTenGoi(String tenGoi) {
		this.tenGoi = tenGoi;
	}
	public float getLaiSuat() {
		return laiSuat;
	}
	public void setLaiSuat(float laiSuat) {
		this.laiSuat = laiSuat;
	}
	public loaiGoiVay getLoaiGoiVay() {
		return loaiGoiVay;
	}
	public void setLoaiGoiVay(loaiGoiVay loaiGoiVay) {
		this.loaiGoiVay = loaiGoiVay;
	}
	
	
	
}

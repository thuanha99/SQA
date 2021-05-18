package com.banking.entity;

import java.sql.Date;
import java.util.ArrayList;

public class hopDongVay {
	private Integer ID;
	private Date ngayVay;
	private String trangThai;
	private Users user;
	private goiVay goiVay;
	private float tienVay;
	private String kiHan;
	private float laiSuat;
	private String loaiGoiVay;
	private ArrayList<phieunoptien> listPhieuNopTien;
	
	public hopDongVay(Integer iD, Date ngayVay, String trangThai, Users user,
			com.banking.entity.goiVay goiVay, String kiHan, ArrayList<phieunoptien> listPhieuNopTien) {
		super();
		ID = iD;
		this.ngayVay = ngayVay;
		this.trangThai = trangThai;
		this.user = user;
		this.goiVay = goiVay;
		this.kiHan = kiHan;
		this.listPhieuNopTien = listPhieuNopTien;
	}
	public float getTienVay() {
		return tienVay;
	}
	public void setTienVay(float tienVay) {
		this.tienVay = tienVay;
	}
	public hopDongVay() {
		super();
	}
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Date getNgayVay() {
		return ngayVay;
	}
	public void setNgayVay(Date ngayVay) {
		this.ngayVay = ngayVay;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public goiVay getGoiVay() {
		return goiVay;
	}
	public void setGoiVay(goiVay goiVay) {
		this.goiVay = goiVay;
	}
	public ArrayList<phieunoptien> getListPhieuNopTien() {
		return listPhieuNopTien;
	}
	public void setListPhieuNopTien(ArrayList<phieunoptien> listPhieuNopTien) {
		this.listPhieuNopTien = listPhieuNopTien;
	}
	public String getKiHan() {
		return kiHan;
	}
	public void setKiHan(String kiHan) {
		this.kiHan = kiHan;
	}
	public float getLaiSuat() {
		return laiSuat;
	}
	public void setLaiSuat(float laiSuat) {
		this.laiSuat = laiSuat;
	}
	public String getLoaiGoiVay() {
		return loaiGoiVay;
	}
	public void setLoaiGoiVay(String loaiGoiVay) {
		this.loaiGoiVay = loaiGoiVay;
	}
	@Override
	public String toString() {
		return "hopDongVay [ID=" + ID + ", ngayVay=" + ngayVay + ", trangThai=" + trangThai + ", user="
				+ user + ", goiVay=" + goiVay + ", listPhieuNopTien=" + listPhieuNopTien + ", kiHan" + kiHan + "]";
	}
}

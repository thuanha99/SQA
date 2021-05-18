package com.banking.entity;

import java.sql.Date;

public class phieunoptien {
	private Integer ID;
	private Date ngayDong;
	private hopDongVay hopDongVay;
	private Float tienLai;
	private Float tienGoc;
	private Integer timeID;
	
	public hopDongVay getHopDongVay() {
		return hopDongVay;
	}
	public void setHopDongVay(hopDongVay hopDongVay) {
		this.hopDongVay = hopDongVay;
	}
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Date getNgayDong() {
		return ngayDong;
	}
	public void setNgayDong(Date ngayDong) {
		this.ngayDong = ngayDong;
	}
	public Float getTienLai() {
		return tienLai;
	}
	public void setTienLai(Float tienLai) {
		this.tienLai = tienLai;
	}
	public Float getTienGoc() {
		return tienGoc;
	}
	public void setTienGoc(Float tienGoc) {
		this.tienGoc = tienGoc;
	}
	public Integer getTimeID() {
		return timeID;
	}
	public void setTimeID(Integer timeID) {
		this.timeID = timeID;
	}
}

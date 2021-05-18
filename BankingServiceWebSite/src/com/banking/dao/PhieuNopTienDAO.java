package com.banking.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.banking.entity.hopDongVay;
import com.banking.entity.phieunoptien;

public class PhieuNopTienDAO extends DAO{

	public PhieuNopTienDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public boolean themPhieuNop(phieunoptien pnt) {
		boolean kq = false;
		String sql = "INSERT INTO "
				+ "phieunoptien(hopdongvayid,ngaydong,tienlai,tiengoc,timeid) "
				+ "values (?,?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, pnt.getHopDongVay().getID());
			ps.setDate(2, pnt.getNgayDong());
			ps.setFloat(3, pnt.getTienLai());
			ps.setFloat(4,pnt.getTienGoc());
			ps.setInt(5, pnt.getTimeID());
			ps.executeUpdate();
			kq = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}
	
	public ArrayList<phieunoptien> getPntByHdvID(int id){
		ArrayList<phieunoptien> kq = new ArrayList<phieunoptien>();
		String sql = "SELECT * FROM phieunoptien WHERE hopdongvayID = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				phieunoptien pnt = new phieunoptien();
				pnt.setID(rs.getInt("id"));
				pnt.setNgayDong(rs.getDate("ngaydong"));
				pnt.setTimeID(rs.getInt("timeid"));
				kq.add(pnt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}
}

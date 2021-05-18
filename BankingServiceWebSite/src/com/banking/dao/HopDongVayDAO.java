package com.banking.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.banking.entity.Users;
import com.banking.entity.goiVay;
import com.banking.entity.hopDongVay;

public class HopDongVayDAO extends DAO{

	public HopDongVayDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<hopDongVay> getHDVByUser(int id){
		ArrayList<hopDongVay> kq = new ArrayList<hopDongVay>();
		String sql = "SELECT * from hopdongvay as hdv "
				+ "INNER JOIN goivay as gv "
				+ "INNER JOIN loaigoivay as lgv "
				+ "where userID = ? AND hdv.goivayID = gv.ID AND gv.loaigoivayID = lgv.ID";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				hopDongVay hdv = new hopDongVay();
				goiVay gv = new goiVay();
				gv.setTenGoi(rs.getString("tengoi"));;
				hdv.setID(rs.getInt("id"));
				hdv.setNgayVay(rs.getDate("ngayvay"));
				hdv.setTienVay(rs.getFloat("tienvay"));
				hdv.setTrangThai(rs.getString("trangthai"));
				hdv.setKiHan(rs.getString("kihan"));
				hdv.setLaiSuat(rs.getFloat("laisuat"));
				hdv.setLoaiGoiVay(rs.getString("ten"));
				hdv.setGoiVay(gv);
				kq.add(hdv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}
	public boolean checkHD (int id) {
		boolean kq = false;
		String sql = "SELECT id from hopdongvay where id = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) kq = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}
	public hopDongVay getByID(int id) {
		hopDongVay kq = new hopDongVay();
		String sql = "SELECT hdv.id as hdv_id, hdv.tienvay, hdv.kihan, gv.laisuat, gv.tengoi from hopdongvay as hdv "
				+ "JOIN goivay as gv ON hdv.goivayID = gv.id "
				+ "where hdv.id = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				goiVay gv = new goiVay();
				gv.setLaiSuat(rs.getFloat("laisuat"));
				gv.setTenGoi(rs.getString("tengoi"));
				kq.setID(rs.getInt("hdv_id"));
				kq.setTienVay(rs.getFloat("tienvay"));
				kq.setKiHan(rs.getString("kihan"));
				kq.setGoiVay(gv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}
}

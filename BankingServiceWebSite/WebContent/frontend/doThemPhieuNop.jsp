<!DOCTYPE html>
<%@page import="com.banking.entity.hopDongVay"%>
<%@page import="com.banking.entity.phieunoptien"%>
<%@page import="java.sql.Date"%>
<%@page import="com.banking.dao.PhieuNopTienDAO"%>

<%@ page contentType="text/html; charset=UTF-8" %> 

<%
	PhieuNopTienDAO phieuNopTienDAO = new PhieuNopTienDAO();
	float goc = Float.parseFloat(request.getParameter("goc"));
	float lai = Float.parseFloat(request.getParameter("lai"));
	int hdvid = Integer.parseInt(request.getParameter("hdvid"));
	int timeid = Integer.parseInt(request.getParameter("timeid"));
	int userid = Integer.parseInt(request.getParameter("userid"));
	String cusName = request.getParameter("cusname").toString();
    long millis=System.currentTimeMillis();  
	Date now = new Date(millis);
	phieunoptien pnt = new phieunoptien();
	pnt.setNgayDong(now);
	pnt.setTienGoc(goc);
	pnt.setTienLai(lai);
	pnt.setTimeID(timeid);
	hopDongVay hdv = new hopDongVay();
	hdv.setID(hdvid);
	pnt.setHopDongVay(hdv);
	boolean kq = phieuNopTienDAO.themPhieuNop(pnt);
	if(kq){
		HttpSession sessionrq = request.getSession(false);
		sessionrq.setAttribute("hdvid", hdvid);
		sessionrq.setAttribute("userid", userid);
		sessionrq.setAttribute("cusname", cusName);
		response.sendRedirect("success.jsp");
	}
	else{
		HttpSession sessionrq = request.getSession(false);
		sessionrq.setAttribute("hdvid", hdvid);
		sessionrq.setAttribute("userid", userid);
		sessionrq.setAttribute("cusname", cusName);
		response.sendRedirect("failed.jsp");
	}
	
%>

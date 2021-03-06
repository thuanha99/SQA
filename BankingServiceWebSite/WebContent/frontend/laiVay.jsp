<!DOCTYPE html>
<%@page import="com.banking.entity.Users"%>
<%@page import="com.banking.entity.chitietLaiVay"%>
<%@page import="com.banking.dao.UsersDAO"%>
<%@page import="com.banking.entity.hopDongVay"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.banking.dao.HopDongVayDAO"%>
<%@page import="com.banking.dao.ChiTietLaiVayDAO"%>
<%@page import="com.banking.dao.PhieuNopTienDAO"%>
<%@page import="com.banking.entity.phieunoptien"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta charset="UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %> 
<title>Danh sách hợp đồng vay</title>
<style>
	table, th, td {
	  border: 1px solid black;
	  padding: 5px;
	}
	table {
	  border-spacing: 3px;
	}
	div.table {
		margin-bottom: 20px;
	}
	div.table1 {
	  display: inline-block;
	  margin-right: 50px; 
	}
	div.table2 {
	  display: inline-block;
	  margin-left: 50px;
	}
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box
}

/* Full-width input fields */
input[type=text], input[type=password] {
	padding: 15px 0px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%	
	if(request.getParameter("hdvid") != null && request.getParameter("userid") != null && request.getParameter("cusname") != null){
		try{
			int hdvid = Integer.parseInt(request.getParameter("hdvid"));
			int userid = Integer.parseInt(request.getParameter("userid"));
			String cusName = request.getParameter("cusname").toString();
			UsersDAO userDAO = new UsersDAO();
			ArrayList<Users> listUser = userDAO.getInfoUser(hdvid);
			ChiTietLaiVayDAO ctlvDAO = new ChiTietLaiVayDAO();
			ArrayList<chitietLaiVay> listLV = ctlvDAO.getCTLVByID(hdvid);
			PhieuNopTienDAO pntDAO = new PhieuNopTienDAO();
			ArrayList<phieunoptien> listPNT = pntDAO.getPntByHdvID(hdvid);
%>
	<div style='margin-top: 20px'>
		<a href="chonKhoanVay.jsp?userid=<%=userid%>&cusname=<%=cusName%>"><button>Quay lại</button></a>
	</div>
	<h1>Thông tin khách hàng và lãi vay chi tiết</h1>
	<div class="table">
	<div class="table1">
	<table >
		<tbody>
<% 

if(listUser.size() != 0){ %>
	<%for (int i = 0 ; i < listUser.size(); i++) {
		Users u = listUser.get(i);
	%>
			<tr>
				<td>Họ và tên: </td>
				<td><%=u.getFullName() %></td>
			</tr>
			<tr>
				<td>Số CCCD: </td>
				<td><%=u.getCccd() %></td>
			</tr>
			<tr>
				<td>Số điện thoại: </td>
				<td><%=u.getPhone() %></td>
			</tr>
			<tr>
				<td>Email: </td>
				<td><%=u.getEmail() %></td>
			</tr>
			<tr>
				<td>Địa chỉ: </td>
				<td><%=u.getAddress() %></td>
			</tr>
	<%} %>
<%} %>
		</tbody>
	</table>
</div>

<div class="table2">
	<table >
		<tbody>
<% if(listLV.size() != 0){ %>
	<%for (int i = 0 ; i < listLV.size(); i++) {
		chitietLaiVay u = listLV.get(i);
	%>
			<tr>
				<td>Kiểu vay: </td>
				<td><%=u.getTenGoi() %></td>
			</tr>
			<tr>
				<td>Ngày vay: </td>
				<td><%=u.getNgayVay() %></td>
			</tr>
			<tr>
				<td>Kỳ hạn: </td>
				<td><%=u.getKiHan()%></td>
			</tr>
			<tr>
				<td>Lãi suất: </td>
				<td><%=u.getLaiSuat() %></td>
			</tr>
			<tr>
				<td>Tiền vay: </td>
				<td><%=u.getTienVay() %></td>
			</tr>
	<%} %>
<%} %>
		</tbody>
	</table>
	</div>
</div>

<%
chitietLaiVay dsLV = listLV.get(0);
String lvduno = "lai suat du no";
String lvcodinh = "lai suat co dinh";
if((dsLV.getTenGoi().trim()).equalsIgnoreCase(lvcodinh)) { 
%>	
	<table>
		<thead>
			<tr>
				<td>STT</td>
				<td>Thời gian</td>
				<td>Khoản lãi vay chi trả</td>
				<td>Trạng thái</td>
			</tr>
		</thead>
		<tbody>
<% if(listLV.size() != 0){ 
	float laiVayCoDinh = 0;
%>
	<%for (int i = 0 ; i < listLV.size(); i++) {
		chitietLaiVay u = listLV.get(i);
		String thoiGian = u.getKiHan();
		String kiHan = thoiGian.substring(0,2);
		int kiHanTG = Integer.parseInt(kiHan.trim());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calender = Calendar.getInstance();
		calender.setTime(formatter.parse(u.getNgayVay().toString()));
		for(int j = 0; j < kiHanTG; j++) {
			String beforeDate = formatter.format(calender.getTime());
			calender.add(Calendar.MONTH, 1);
	        String afterDate = formatter.format(calender.getTime());
	%>
			<tr>
				<td><%=j+1%></td>
				<td>[<%=beforeDate %>] - [<%=afterDate %>]</td>
				<td><%=u.getTienVay() * (u.getLaiSuat()/kiHanTG) %> VND</td>
					<%laiVayCoDinh += (u.getTienVay() * (u.getLaiSuat()/kiHanTG)); %>
				<%
					Boolean datra = true;
					if(listPNT.size() > 0){
						for(int k = 0; k < listPNT.size(); k++){
							phieunoptien pnt = listPNT.get(k);
							if(pnt.getTimeID().equals(j+1)){
								datra = false;
							}
						}
					}
				%>
				<%if(datra == false) { %>
					<td style="text-align: center">Đã trả</td>
				<%} else { %>
					<td></td>
				<%} %>
			</tr>
		<%} %>
		</tbody>
	</table>
	<br>
	<br>
	
	<h3>* Tổng lãi vay chi trả: <%=laiVayCoDinh %> VND</h3>
	<h3>* Tiền gốc phải chi trả: <%=u.getTienVay()%> VND</h3>
	<h3>=> Tổng tiền gốc và lãi chi trả: <%=u.getTienVay() + laiVayCoDinh%> VND</h3>
	<%} %>
<%} %>	
<%} else {
%>
	<table>
		<thead>
			<tr>
				<td>STT</td>
				<td>Thời gian</td>
				<td>Khoản lãi vay chi trả</td>
				<td>Khoản cố định phải chi trả</td>
				<td>Trạng thái</td>
			</tr>
		</thead>
		<tbody>
<% if(listLV.size() != 0){ 
	float laiVayDuNo = 0;
%>
	<%for (int i = 0 ; i < listLV.size(); i++) {
		chitietLaiVay u = listLV.get(i);
		String thoiGian = u.getKiHan();
		String kiHan = thoiGian.substring(0,2);
		int kiHanTG = Integer.parseInt(kiHan.trim());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calender = Calendar.getInstance();
		calender.setTime(formatter.parse(u.getNgayVay().toString()));
		for(int j = 0; j < kiHanTG; j++) {
			String beforeDate = formatter.format(calender.getTime());
			calender.add(Calendar.MONTH, 1);
	        String afterDate = formatter.format(calender.getTime());
	%>
			<tr>
				<td><%=j+1%></td>
				<td>[<%=beforeDate %>] - [<%=afterDate %>]</td>
				<td><%=(u.getTienVay() - ((u.getTienVay()/kiHanTG)*j)) * u.getLaiSuat() %> VND</td>
				<%laiVayDuNo += (u.getTienVay() - ((u.getTienVay()/kiHanTG)*j)) * u.getLaiSuat(); %>
				<td><%=u.getTienVay()/kiHanTG %> VND</td>
				<%
					Boolean datra = true;
					if(listPNT.size() > 0){
						for(int k = 0; k < listPNT.size(); k++){
							phieunoptien pnt = listPNT.get(k);
							if(pnt.getTimeID().equals(j+1)){
								datra = false;
							}
						}
					}
				%>
				<%if(datra == false) { %>
					<td style="text-align: center">Đã trả</td>
				<%} else { %>
					<td></td>
				<%} %>
			</tr>
		<%} %>
		</tbody>
	</table>
	<br>
	<br>
	
	<h3>* Tổng lãi vay phải chi trả: <%=laiVayDuNo %> VND</h3>
	<h3>* Tiền gốc cuối kì phải chi trả: 0 VND</h3>
	<h3>=> Tổng tiền gốc và lãi chi trả: <%=u.getTienVay() + laiVayDuNo%> VND</h3>
	<%} %>
	<%} %>	
<%} %>	
<% 	}
		catch(NumberFormatException e){
			response.sendRedirect("main.jsp");
		}
	}
	else response.sendRedirect("main.jsp");
	
%>
</body>
</html>
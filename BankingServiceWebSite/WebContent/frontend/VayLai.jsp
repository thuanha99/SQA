<%@page import="com.banking.dao.HDVaydao"%>
<%@page import="com.banking.entity.HDVay"%>
<%@page import="com.banking.dao.CmndDAO"%>
<%@page import="com.banking.dao.ToKhaiDAO"%>
<%@page import="com.banking.entity.Cmnd"%>
<%@page import="com.banking.entity.ToKhai"%>
<%@page import="com.banking.dao.UsersDAO"%>
<%@page import="com.banking.entity.Users"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box
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
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String customerIDStr = request.getParameter("customerid");
String cusName = request.getParameter("cusname");
ArrayList<Users> user= new ArrayList<Users>();
ArrayList<ToKhai> tk = new ArrayList<ToKhai>();
ArrayList<Cmnd> cmnds = new ArrayList<Cmnd>();
String tkID = request.getParameter("tkid");
ArrayList<HDVay> hdVay = new ArrayList<HDVay>();
int tkid = Integer.parseInt(tkID);
if(customerIDStr != null && customerIDStr.length()>0){
	int customerID= Integer.parseInt(customerIDStr.trim());
	UsersDAO usersDAO = new UsersDAO();
	user = usersDAO.searchUsersID(customerID);
	ToKhaiDAO tkDAO = new ToKhaiDAO();
	CmndDAO cmndDAO = new CmndDAO();
	tk = tkDAO.getTKByID(tkid);
	if(user.get(0).getCccd()!=null){
		cmnds = cmndDAO.getCmnd(user.get(0).getCccd());
	}
	HDVaydao hdVayDAO = new HDVaydao();
    hdVay = hdVayDAO.searchHDVayByTKId(tkid, customerID);
}	
%>

	<div style='margin-top: 20px; margin-bottom: 20px'>
		<button onclick="location.href='DSKhaiBao.jsp?customerid=<%=customerIDStr%>&cusname=<%=cusName%>';">Quay l???i</button>
	</div>


<p>Th??ng tin Kh??ch h??ng</p>
    <table>
		<thead>
			<tr>
				
				<td>H??? t??n</td>
				<td>Email</td>
				<td>S??? ??i???n tho???i</td>
				<td>Ng??y Sinh</td>
				<td>D???a ch??? hi???n t???i</td>
			</tr>
		</thead>
		<tbody>
			<%for (int i = 0 ; i < user.size(); i++) {
				Users u = user.get(i);
			%>
				<tr>
					
					<td><%=u.getFullName() %></td>
					<td><%=u.getEmail() %></td>
					<td><%=u.getPhone() %></td>
					<td><%=u.getDob() %></td>
					<td><%=u.getAddress() %></td>
				</tr>
			<%} %>
		</tbody>
		
	</table><br>
<p>Th??ng tin khai b??o vay</p>
    <table>
		<thead>
			<tr>
				
				<td>Ngh??? nghi???p</td>
				<td>Ch???c v???</td>
				<td>L??m vi???c t???i</td>
				<td>?????a ch??? n??i l??m vi???c</td>
				<td>M???c l????ng</td>
				<td>M???c chi ti??u</td>
			</tr>
		</thead>
		<tbody>
			<%for (int i = 0 ; i < tk.size(); i++) {
				ToKhai ntk = tk.get(i);
			%>
				<tr>
					
					<td><%=ntk.getNghenghiep()%></td>
					<td><%=ntk.getChucvu() %></td>
					<td><%=ntk.getTencongty() %></td>
					<td><%=ntk.getDiachicongty() %></td>
					<td><%=ntk.getMucluong() %></td>
					<td><%=ntk.getChitieuhangthang() %></td>
				</tr>
			<%} %>
		</tbody>
		
	</table>
                        <% if(hdVay == null || hdVay.size()<1){%>
            <h1>Giao di???n th??m m???i h???p ?????ng vay</h1>
        <form name="them" action="doAddHD.jsp" method="post">
            <table>
                <tr>
                    <td>G??i Vay</td>
                    <td>
                        <input type="radio" name="goivay" value="1" required>L??i su???t d?? n???
                        <input type="radio" name="goivay" value="2">L??i su???t c??? ?????nh
                        
                    </td>
                </tr>
                <tr>
                    <td>User ID</td>
                    <td>
                        <input type="text" name="userID" value="<%=customerIDStr%>" style="background-color: grey;" readonly>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <label for="ngayvay">Ng??y Vay: </label>
                    <input type="date" id="ngayvay" name="ngayvay" required>
                    
                </tr>
                <tr>
                <td>K?? H???n</td>
                    <td>
                        <input type="radio" name="kiHan" value="1 thang" required>1 th??ng
                        <input type="radio" name="kiHan" value="3 thang">3 th??ng
                        <input type="radio" name="kiHan" value="6 thang">6 th??ng  
                        <input type="radio" name="kiHan" value="12 thang">12 th??ng
                    </td>
                </tr>
                    <tr>    
                <td>Tr???ng th??i</td>
                    <td>
                        <input type="radio" name="trangthai" value="chua duyet" required>Ch??a duy???t
                        <input type="radio" name="trangthai" value="da duyet">???? duy???t                        
                    </td>
                    </tr>
                <tr>
                    <td>Ti???n vay</td>
                    <td>
                        <input type="number" min ="0"  name="tienvay" required>
                    </td>
                </tr>
                <tr>
                    <td>T??? khai ID</td>
                    <td>
                        <input type="text" name="tokhaiID" value="<%=tkID%>" style="background-color: grey;" readonly>
                    </td>
                </tr>
                    
                    <td><input type="submit" value="Th??m m???i"></td>
                
            </table>
            
        </form>        
        <% }
        else{ %>
            <h1>Giao di???n s???a h???p ?????ng</h1>
        <form name="capnhat" action="doUpdate.jsp" onsubmit="return check()" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <input value="<%=hdVay.get(0).getid() %>" type="text" name="ID" style="background-color: grey;" readonly>
                    </td>
                </tr>
                <tr>
                    <td>G??i Vay</td>
                    <td>
                        <input type="radio" name="goivay" value="1" <%=hdVay.get(0).getGoivayID() == 1?"checked":""%>>L??i su???t d?? n???
                        <input type="radio" name="goivay" value="2" <%=hdVay.get(0).getGoivayID() == 2?"checked":""%>>L??i su???t c??? ?????nh
                        
                    </td>
                </tr>
                <tr>
                    <td>User ID</td>
                    <td>
                        <input value="<%=hdVay.get(0).getUserID() %>" type="text" name="userID" style="background-color: grey;" readonly>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <label for="ngayvay">Ng??y Vay: </label>
                    <input value="<%=hdVay.get(0).getNgayvay() %>" type="date" id="ngayvay" name="ngayvay">
                    
                </tr>
                <tr>
                <td>K?? H???n</td>
                    <td>
                        <input type="radio" name="kiHan" value="1 thang" <% if(hdVay.get(0).getkiHan().equalsIgnoreCase("1 thang")) { %> checked <% } %>>1 th??ng
                        <input type="radio" name="kiHan" value="3 thang" <% if(hdVay.get(0).getkiHan().equalsIgnoreCase("3 thang")) { %> checked <% } %>>3 th??ng
                        <input type="radio" name="kiHan" value="6 thang" <% if(hdVay.get(0).getkiHan().equalsIgnoreCase("6 thang")) { %> checked <% } %>>6 th??ng 
                        <input type="radio" name="kiHan" value="12 thang" <% if(hdVay.get(0).getkiHan().equalsIgnoreCase("12 thang")) { %> checked <% } %>>12 th??ng
                    </td>
                </tr>
                <tr>
                <td>Tr???ng th??i</td>
                    <td>
                        <input type="radio" name="trangthai" value="chua duyet" <% if(hdVay.get(0).getTrangthai().equalsIgnoreCase("chua duyet")) { %> checked <% } %>>Ch??a duy???t
                        <input type="radio" name="trangthai" value="da duyet" <% if(hdVay.get(0).getTrangthai().equalsIgnoreCase("da duyet")) { %> checked <% } %>>???? duy???t                        
                    </td>
                </tr>
                <tr>
                    <td>Ti???n vay</td>
                    <td>
                        <input value="<%=hdVay.get(0).getTienVay() %>" type="text" name="tienvay">
                    </td>
                </tr>
                <tr>
                    <td>T??? khai ID</td>
                    <td>
                        <input value="<%=hdVay.get(0).gettokhaiID() %>" type="text" name="tokhaiID" style="background-color: grey;" readonly>
                    </td>
                </tr>
                    
                    <td><input type="submit" value="C???p nh???t"></td>
                </tr>
            </table>
                
        </form>
            <div style='margin-top: 20px'>
		<a href="xemHD.jsp"><button>Quay l???i</button></a>
	</div>
        <% }
        %>
        
</body>
</html>
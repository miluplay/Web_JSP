<%--
  Created by IntelliJ IDEA.
  User: AlanLee
  Date: 2019/3/21
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>连接数据库</title>
</head>
<body>
<h3>测试连接数据库</h3>
<%@page import="java.sql.*"%>



<%
  //      定义一些参数
  String DRIVER_PATH = "com.mysql.cj.jdbc.Driver";    //驱动路径

  //我的数据库端口为3307，看这个教程需要改成你们的端口（默认3306），jspdb为你建的数据库的名称
  //?serverTimezone=UTC 这段要加上，不然会报错，我的是mysql8.0.15
  String URL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
  String USER_NAME = "root";      //数据库用户名
  String PASSWORD = "123456";     //数据库密码
%>


<%
  Connection con = null;
  Class.forName(DRIVER_PATH).newInstance();
  con = DriverManager.getConnection(URL,USER_NAME,PASSWORD);

//      判断数据库是否连接成功
  if (con != null){
    out.println("数据库连接成功");
  }else {
    out.println("数据库连接失败");
  }
  String sql = "SELECT * FROM goods";

  PreparedStatement preparedStatement = con.prepareStatement(sql);
  ResultSet resultSet = preparedStatement.executeQuery();
%>

<%
  //打印获取到的数据库的内容
  while (resultSet.next()){
%>

<p>商品名称:<% out.print(resultSet.getString("goodsname"));%></p>
<p>商品价格:<%=resultSet.getString("price")%></p>
<hr>

<%
  }

  //关闭数据库
  resultSet.close();
  preparedStatement.close();
%>

</body>
</html>


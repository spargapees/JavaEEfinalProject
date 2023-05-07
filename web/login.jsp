<%@ page import="kz.bitlab.techorda.db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: Aza
  Date: 13.04.2023
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="head.jsp"%>
</head>
<body>
  <%@ include file="header.jsp"%>

  <div class = "container">
    <div class="row mt-3">
      <div class="col-6 mx-auto">
    <%
      String error = request.getParameter("error");
      if(error!=null){
    %>

        <div class = "row mt-3">
          <div class = "col-12">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
              Incorrect email or password, try again!
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          </div>
        </div>

    <%
      }
    %>
    <div class = "container" style="min-height: 500px">


<form action = "/login" method = "post">
  <div style="min-height: 500px">
  <div class  = "row mt-2">
    <div class = "col-12">
      <label>Email :</label>
    </div>
  </div>
  <div class = "row mt-2">
    <div class = "col-12">
      <input type = "email" class="form-control" name = "email" required placeholder="example@gmail.com">
    </div>
  </div>
  <div class = "row mt-3">
    <div class = "col-12">
      <label>Password :</label>
    </div>
  </div>
  <div class = "row mt-2">
    <div class = "col-12">
      <input type = "password" class="form-control" name = "password" required >
    </div>
  </div>
  <div class = "row mt-3">
    <div class = "col-12">
      <button class = "btn btn-success">Sign In</button>
    </div>
  </div>
  </div>

</form>
        </div>
      </div>
</div>
  </div>



</body>
</html>

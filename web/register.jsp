<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <%@include file="head.jsp"%>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container" style="min-height: 500px;">
  <div class="row mt-3">
    <div class="col-6 mx-auto">
      <%
        String emailError = request.getParameter("emailerror");
        if(emailError!=null){
      %>
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Email is busy!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      <%
        }
      %>
      <%
        String passwordError = request.getParameter("passworderror");
        if(passwordError!=null){
      %>
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Passwords are not same!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      <%
        }
      %>
      <%
        String success = request.getParameter("success");
        if(success!=null){
      %>
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        User added successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      <%
        }
      %>
      <form action="/register" method="post">
        <div class="row">
          <div class="col-12">
            <label>Email :</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="email" class="form-control" required placeholder="Email" name="email">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>Password :</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="password" class="form-control" required placeholder="Password" name="password">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>Repeat Password :</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="password" class="form-control" required placeholder="Repeat password" name="re_password">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>Full Name :</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="text" class="form-control" required placeholder="Full name" name="full_name">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label class="form-label">Role :</label>
            <select name="admin">
              <option selected = "selected">User</option>
              <option>Admin</option>
            </select>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <button class="btn btn-success">Sign Up</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
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
  <title>Title</title>
  <link rel = "stylesheet" type = "text/css" href = "/css/bootstrap.css">
  <link rel = "stylesheet" type = "text/css" href = "/css/style.css">
  <script defer src="/js/bootstrap.js"></script>
</head>
<body>

<div class = "container">

  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/" ><strong>BITLAB SHOP</strong></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse position-absolute top-0 end-0" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Top Sales</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="#">New Sales</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="#">By Category</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active">Sign in</a>

          </li>
        </ul>
      </div>
    </div>
  </nav>


  <%
    if (request.getAttribute("error") != null) {
  %>
  <div class="alert alert-danger mt-3" style="width: 50%; margin-left: 300px;" role="alert">
    Incorrect <b>email</b> or <b>password</b>
  </div>
  <%
    }
  %>


<form action = "/login" method = "post">
  <div style="width: 50%; margin-left: 300px; margin-top: 10px">
  <div class  = "row">
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


</body>
</html>

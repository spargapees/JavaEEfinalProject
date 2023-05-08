<%--
  Created by IntelliJ IDEA.
  User: Aza
  Date: 06.05.2023
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container" style="min-height: 500px;">
  <div class="row mt-3">
    <div class="col-8 mx-auto">
      <%
        String success = request.getParameter("success");
        if(success!=null){
      %>

      <div class="alert alert-success alert-dismissible fade show" role="alert">
        Blog added successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      <%
        }
      %>
      <%
        String error = request.getParameter("error");
        if(error!=null){
      %>
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Error on adding blog!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      <%
        }
      %>
      <form action="/addblog" method="post">
        <div class="row">
          <div class="col-12">
            <label>Title :</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="text" class="form-control" name="title" placeholder="Title" required>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label class="form-label">Category :</label>
            <select name="category" required>
              <option value = ""></option>
              <option value = "Entertainment">Entertainment</option>
              <option value = "Fashion">Fashion</option>
              <option value = "Politics">Politics</option>
              <option value = "Education">Education</option>
              <option value = "Health">Health</option>
              <option value = "Sports">Sports</option>
              <option value = "Internet">Internet</option>
              <option value = "Games">Games</option>
            </select>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>Content :</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <textarea class="form-control" name="content" rows="5" placeholder="Content"></textarea>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <button class="btn btn-success">Add Blog</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>

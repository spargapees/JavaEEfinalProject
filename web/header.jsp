<%@ page import="kz.bitlab.techorda.db.User" %>
<%
  User currentUser = (User)session.getAttribute("currentUser");
%>

<div class = "container">
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/" ><strong>BITLAB BLOG</strong></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <%
            if (currentUser == null) {
          %>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/register">Register</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/login">Login</a>
          </li>

          <%
            }
            else {
          %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              <%=currentUser.getFullName()%>
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="/profile">Profile</a></li>
              <%
                System.out.println(currentUser.getRole_id());
                System.out.println(currentUser.getEmail());
                if (currentUser.getRole_id() == 1) {
              %>
              <li><a class="dropdown-item" href="/addblog">Add Blog</a></li>
              <%
                }
              %>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="/logout">Logout</a></li>
            </ul>
          </li>
          <%
            }
          %>
        </ul>
      </div>
    </div>
  </nav>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kz.bitlab.techorda.db.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.Blog" %>

<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>

<%@include file="header.jsp"%>


<div class="container" style="min-height: 500px;">


<%
    ArrayList<Blog> blogs = (ArrayList<Blog>)request.getAttribute("blogs");
    for (Blog blog : blogs) {
%>


    <div class="row mt-3 " style="background-color: #bacbe6; margin-right: 1px; margin-left: 1px">
        <div class="col-12">
            <div class = "d-flex justify-content-between align-items-center ms-2">
                <div class = "title-link" style = "width: 80%">
                    <a style="text-decoration: none;" class = "display-5" href="/details?blog_id=<%=blog.getId()%>"><%=blog.getTitle()%></a>
                </div>
                <div class = "d-flex justify-content-around" style="width: 15%; <%

                    if (currentUser == null || currentUser.getRole_id() != 1) {

                    %>

                     visibility: hidden;


                        <%
                            }
                    %>
                    ">
                    <%
                        request.setAttribute("blog_id", blog.getId());
                    %>

                </div>
            </div>
            <div class = "d-flex justify-content-between align-items-center ms-2 mt-1">
                <p class = "lead"><em><%=blog.getTime()%></em></p>
            </div>
            <div class = "border-top border-dark">
                <p class="lead"><%=blog.getContent()%></p>
            </div>

            <%
            if(currentUser!=null){

            %>
            <div class="row mt-2">
                <div class="col-12">
                    <form action="/addcomment" method="POST">
                        <input type="hidden" name="blog_id" value="<%=blog.getId()%>">
                        <textarea class="form-control" name="comment" placeholder="Write a comment"></textarea>
                        <button class="btn btn-primary mt-3">Add Comment</button>
                    </form>
                </div>
            </div>
            <%

                }
            %>
        </div>
    </div>
<%
    }
%>
</div>

</body>
</html>
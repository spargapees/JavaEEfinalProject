<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.Task" %><%--
  Created by IntelliJ IDEA.
  User: Aza
  Date: 13.04.2023
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>>
</head>
<body>


    <%@ include file="header.jsp"%>
    <div class="container ">
    <div class = "mt-4"></div>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        + Добавить задание
    </button>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%@include file="addTask.jsp"%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>

                </div>
            </div>
        </div>
    </div>

    <div class = "mt-4"></div>

    <div class = "row">
        <div class = "col-12">
            <table class = "table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Наименование</th>
                    <th>Крайний срок</th>
                    <th>Выполнено</th>
                    <th>Детали</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <%
                    ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("zadachi");
                    for (Task t : tasks) {
                %>
                <tr>
                    <td style="width: 5%">
                        <%=t.getId()%>
                    </td>
                    <td style="width: 50%">
                        <%=t.getName()%>
                    </td>
                    <td style="width: 15%">
                        <%=t.getDeadlineDate()%>
                    </td>
                    <td style="width: 15%">
                        <%
                            if (t.getStatus()) {

                        %>
                        Да
                        <%
                        } else {
                        %>
                        Нет
                        <%
                            }
                        %>
                    </td>
                    <td style="width: 15%">
                        <%
                            request.setAttribute("task_id", t.getId());
                        %>
                        <a href = "/details?task_id=<%=t.getId()%>" class="btn btn-primary" type="submit">Детали</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

    </div>



</div>


    </body>
</html>

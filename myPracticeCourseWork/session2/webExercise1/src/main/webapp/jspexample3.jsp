<%-- 
    Document   : jspexample3
    Created on : Oct 13, 2021, 2:51:45 AM
    Author     : jona1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%
    // retrieve the stored users list from the session
    List<String> users = (List<String>) session.getAttribute("users");
    if (users == null) {
        users = new ArrayList<String>();
        session.setAttribute("users", users);
    }

    String name = request.getParameter("userName");

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("removeUser".equals(action)) {
        users.remove(name);
    } else if ("addUser".equals(action)) {
        users.add(name);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <body>
        <h1>JSP Example 3: User list</h1>

        <h2>user table</h2>
        <!-- use to loop through the list of user, pure java code --> 
        <% for (String user : users) {%>
        <table>
            <tr>
                <td>
                    <!-- java code to print the user after every loop. --> 
                    <%=user%>
                </td>
                <td>
                    <!-- here in the first input the type is hidden not text -->
                    <!-- the value is changed to the user name got from the loop -->
                    <form action="./jspexample3.jsp" method="get">
                    <input type="hidden" name="userName" value="<%=user%>">
                    <input type="hidden" name="action" value="removeUser">
                    <button type="submit" >remove name from list</button>
                    </form> 
                </td>
            </tr>

        </table>
        <%
            }
        %>
        <h2>commands</h2>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="addUser">
            <button type="submit" >add name to list</button>
        </form> 
        <br>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="removeUser">
            <button type="submit" >remove name from list</button>
        </form> 


    </body>
</html>
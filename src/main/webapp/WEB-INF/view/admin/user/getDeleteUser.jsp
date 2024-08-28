<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Delete User ${user.fullName}</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>
            </head>

            <body>
                <div class="container mt-3">
                    <div class="d-flex flex-column">
                        <h3 class="d-inline"> Delete user: ${user.fullName}</h3>
                    </div>
                    <hr>
                    <div class="alert alert-danger" role="alert">
                        <h5>
                            Do you want to delete the user: ${user.fullName} ?
                        </h5>
                    </div>
                    <form:form action="/admin/user/delete" method="POST" modelAttribute="user">
                        <div class="d-none">
                            Id
                            <form:input type="text" class="form-control" path="id"></form:input>
                        </div>
                        <button class="btn btn-danger">Yes! Pleass.......</button>
                    </form:form>
                    <a class="btn btn-warning mt-2" href="/admin/user">No! Back to List User page</a>
                </div>
            </body>

            </html>
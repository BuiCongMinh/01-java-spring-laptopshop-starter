<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Detail ${id}</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>
            </head>

            <body>
                <div class="container mt-5">
                    <h1>User detail with id: ${id}</h1>
                    <hr>
                    <div class="card" style="width: 18rem;">
                        <div class="card-header">
                            <h4>User Information</h4>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">ID : ${id}</li>
                            <li class="list-group-item">Email : ${detailUser.email} </li>
                            <li class="list-group-item">Full Name: ${detailUser.fullName} </li>
                            <li class="list-group-item">Address : ${detailUser.address} </li>
                        </ul>
                    </div>
                    <br>
                    <a href="/admin/user" class="btn btn-primary">back</a>
                </div>

            </body>

            </html>
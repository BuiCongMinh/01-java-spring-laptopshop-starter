<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>

            </head>

            <body>

                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-10 col-12 mx-auto">
                            <div class="container">
                                <div class="row mb-4">
                                    <div class="col">
                                        <h1 class='text-left'>All User</h1>
                                    </div>
                                    <div class="col d-flex justify-content-end py-3">
                                        <button class="btn btn-outline-primary"><a href="/admin/user/create"
                                                class="text-decoration-none">Create User</a></button>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <table class="table table-bordered table-hover table-dark ">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${allUsers}">
                                        <tr>
                                            <th scope="row">${user.id}</th>
                                            <td>${user.email}</td>
                                            <td>${user.fullName}</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col">
                                                        <a class="btn btn-success me-2"
                                                            href="/admin/user/${user.id}">View</a>
                                                        <a class="btn btn-primary me-2"
                                                            href="/admin/user/update/${user.id}">Update</a>
                                                        <a class="btn btn-danger"
                                                            href="/admin/user/delete/${user.id}">Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </body>

            </html>
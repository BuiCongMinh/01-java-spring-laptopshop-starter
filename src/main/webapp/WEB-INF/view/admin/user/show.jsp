<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>

                <link href="/css/styles.css" rel="stylesheet" />

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav" class="ms-4">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <h1 class="mt-4">Manager User</h1>
                        <ol class="breadcrumb mb-4 gap-1">
                            <a href="/admin">Dashboard</a>
                            <span>/</span>
                            <span>User</span>
                        </ol>
                        <main>
                            <div class="all-users">
                                <div class="row">
                                    <div class="col-md-11 col-12">
                                        <div class="ms-2">
                                            <div class="row mb-4">
                                                <div class="col">
                                                    <h2 class='text-left'>All User</h2>
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
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>



            </body>

            </html>
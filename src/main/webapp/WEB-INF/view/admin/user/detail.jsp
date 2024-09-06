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
                            <span>/</span>
                            <span>Id ${id}</span>
                        </ol>
                        <main>
                            <div class="mt-3">
                                <h3>User detail with id: ${id}</h3>
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
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>



            </body>

            </html>
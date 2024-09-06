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
                            <span>Update</span>
                        </ol>
                        <main>
                            <div class="container mt-3">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3 class="d-inline-block">Update User: ${userId.fullName}</h3>
                                            <a href="/admin/user" class="btn btn-warning px-4">back</a>
                                        </div>
                                        <hr>

                                        <form:form method="post" action="/admin/user/update" modelAttribute="userId">
                                            <div class="mb-3 d-none">
                                                <label class="form-label">ID</label>
                                                <form:input class="form-control id" path="id" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email</label>
                                                <form:input class="form-control email" type="email" path="email"
                                                    disabled="true" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Full Name</label>
                                                <form:input class="form-control fullName" path="fullName" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label address">Address</label>
                                                <form:input class="form-control address" path="address" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label phone">Phone Number</label>
                                                <form:input class="form-control password" path="phone" />
                                            </div>

                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </form:form>
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
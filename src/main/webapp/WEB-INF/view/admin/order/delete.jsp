<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    this is update pages !
</body>

</html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                    <meta name="author" content="Hỏi Dân IT" />
                    <title>Detail Order - Hỏi Dân IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />

                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

                </head>

                <body class="sb-nav-fixed">
                    <!-- header  -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- end  -->

                    <div id="layoutSidenav" class="ms-4">
                        <!-- sidebar -->
                        <jsp:include page="../layout/sidebar.jsp" />
                        <!-- end  -->

                        <div id="layoutSidenav_content">
                            <h1 class="mt-4">Manager Order</h1>
                            <ol class="breadcrumb mb-4 gap-1">
                                <a href="/admin">Dashboard</a>
                                <span>/</span>
                                <a href="/admin/order">Order</a>
                                <span>/</span>
                                <span>Delete</span>
                            </ol>
                            <main>
                                <div class="container-fluid px-4">
                                    <div class=" mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Delete the order with id = ${id}</h3>
                                                </div>

                                                <hr />
                                                <div class="alert alert-danger">
                                                    Are you sure to delete this order ?
                                                </div>
                                                <form:form method="post" action="/admin/order/delete"
                                                    modelAttribute="newOrder">
                                                    <div class="mb-3" style="display: none;">
                                                        <label class="form-label">Id:</label>
                                                        <form:input value="${id}" type="text" class="form-control"
                                                            path="id" />
                                                    </div>
                                                    <button class="btn btn-danger">Confirm</button>
                                                </form:form>

                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </main>

                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>

                </body>

                </html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Admin Product</title>
                <link href="/css/styles.css" rel="stylesheet" />

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                        <!-- title  -->
                        <h1 class="mt-4">Manager Product</h1>
                        <ol class="breadcrumb mb-4 gap-1">
                            <a href="/admin">Dashboard</a>
                            <span>/</span>
                            <span>product</span>
                        </ol>
                        <!-- end  -->

                        <main>
                            <div class="all-products">
                                <div class="row">
                                    <div class="col-md-11 col-12">
                                        <div class="ms-2">
                                            <div class="row mb-4">
                                                <div class="col">
                                                    <h2 class='text-left'>All User</h2>
                                                </div>
                                                <div class="col d-flex justify-content-end py-3">
                                                    <button class="btn btn-outline-primary">
                                                        <a href="/admin/product/create" class="text-decoration-none">
                                                            Create Product
                                                        </a>
                                                    </button>
                                                </div>
                                                <hr>
                                            </div>
                                        </div>
                                        <table class="table table-bordered table-hover table-dark ">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Factory</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${allProduct}">
                                                    <tr>
                                                        <th scope="row">${product.id}</th>
                                                        <td>${product.name}</td>
                                                        <td>${product.price}</td>
                                                        <td>
                                                            ${product.factory}
                                                        </td>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <a class="btn btn-success me-2"
                                                                        href="/admin/product/${product.id}">View</a>
                                                                    <a class="btn btn-primary me-2"
                                                                        href="/admin/product/update/${product.id}">Update</a>
                                                                    <a class="btn btn-danger"
                                                                        href="/admin/product/delete/${product.id}">Delete</a>
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

                        <!-- footer  -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!-- end  -->

                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>
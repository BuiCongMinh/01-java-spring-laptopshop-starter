<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Order</title>
                <link href="/css/styles.css" rel="stylesheet" />

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
                        <h1 class="mt-4">Manager Order</h1>
                        <ol class="breadcrumb mb-4 gap-1">
                            <a href="/admin">Dashboard</a>
                            <span>/</span>
                            <span>Order</span>
                        </ol>

                        <main>
                            <div class="my-5">
                                <div class="row col-12 mx-auto">
                                    <div class="d-flex">
                                        <h3>Table Orders</h3>
                                    </div>
                                    <hr />
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Total Price</th>
                                                <th>User</th>
                                                <th>Status</th>
                                                <th>Payment</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr>
                                                    <th>${order.id}</th>
                                                    <td>
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                                    </td>
                                                    <td>${order.user.fullName}</td>
                                                    <td>${order.status}</td>
                                                    <td>
                                                        <div>Status: ${order.paymentStatus}</div>
                                                        <div>Ref: ${order.paymentRef}</div>
                                                        <div>Method: ${order.paymentMethod}</div>
                                                    </td>
                                                    <td>
                                                        <a href="/admin/order/${order.id}"
                                                            class="btn btn-success">View</a>
                                                        <a href="/admin/order/update/${order.id}"
                                                            class="btn btn-warning">Update</a>
                                                        <a href="/admin/order/delete/${order.id}"
                                                            class="btn btn-danger">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item">
                                                <a class="${1 eq currentPage ? 'd-none page-link' : 'page-link'}"
                                                    href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                <li class="page-item">
                                                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                        href="/admin/order?page=${loop.index + 1}">
                                                        ${loop.index + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="${totalPages eq currentPage ? 'd-none page-link' : 'page-link'}"
                                                    href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>

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
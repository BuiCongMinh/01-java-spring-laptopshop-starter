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

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const productFile = $("#productFile");
                        productFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                            <a href="/admin/product">Product</a>
                            <span>/</span>
                            <span>create</span>
                        </ol>
                        <!-- end  -->

                        <main>
                            <div class="container mt-1">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Create a Product</h3>
                                        <hr>
                                        <form:form class="row g-3" method="post" action="/admin/product/create"
                                            modelAttribute="newProduct" enctype="multipart/form-data">
                                            <!-- c:set  -->
                                            <c:set var="nameHasBindError">
                                                <form:errors path="name" class="invalid-feedback" />
                                            </c:set>
                                            <c:set var="priceHasBindError">
                                                <form:errors path="price" class="invalid-feedback" />
                                            </c:set>
                                            <c:set var="deDescHasBindError">
                                                <form:errors path="detailDesc" class="invalid-feedback" />
                                            </c:set>
                                            <c:set var="soDescHasBindError">
                                                <form:errors path="shortDesc" class="invalid-feedback" />
                                            </c:set>
                                            <c:set var="quaHasBindError">
                                                <form:errors path="quantity" class="invalid-feedback" />
                                            </c:set>
                                            <!-- end  -->

                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Name: </label>

                                                <form:input
                                                    class="form-control ${not empty nameHasBindError ? 'is-invalid':''}"
                                                    path="name" />
                                                ${nameHasBindError}

                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Price: </label>

                                                <form:input type="number"
                                                    class="form-control ${not empty priceHasBindError? 'is-invalid':''}"
                                                    id="exampleInputPassword1" value="0.0" path="price" />
                                                ${priceHasBindError}
                                            </div>
                                            <div class="col-md-12 col-12">
                                                <label class="form-label">Detail description: </label>

                                                <form:textarea
                                                    class="form-control ${not empty deDescHasBindError? 'is-invalid':''}"
                                                    path="detailDesc" rows="2" />

                                                ${deDescHasBindError}
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Short description: </label>

                                                <form:input type="text"
                                                    class="form-control ${not empty soDescHasBindError? 'is-invalid':''}"
                                                    path="shortDesc" />
                                                ${soDescHasBindError}
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Quantity: </label>

                                                <form:input type="number"
                                                    class="form-control ${not empty quaHasBindError ? 'is-invalid':''}"
                                                    path="quantity" value="0" />
                                                ${quaHasBindError}
                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label role">Factory </label>
                                                <form:select class="form-select" path="factory">
                                                    <form:option value="Apple (MacBook)" label="Apple (MacBook)" />
                                                    <form:option value="Asus" label="Asus" />
                                                    <form:option value="Lenovo" label="Lenovo" />
                                                    <form:option value="Dell" label="Dell" />
                                                    <form:option value="LG" label="LG" />
                                                    <form:option value="Acer" label="Acer" />
                                                </form:select>
                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label role">Target: </label>
                                                <form:select class="form-select" path="target">
                                                    <form:option value="Gaming">Gaming</form:option>
                                                    <form:option value="Sinh viên-Văn phòng">Sinh viên-Văn phòng
                                                    </form:option>
                                                    <form:option value="Thiết kế đồ hoạ">Thiết kế đồ hoạ
                                                    </form:option>
                                                    <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                                    <form:option value="Doanh nhân">Doanh nhân</form:option>
                                                </form:select>
                                            </div>

                                            <div class="col-md-8 col-12">
                                                <label for="avatarFile" class="form-label">Image: </label>
                                                <input
                                                    class="form-control ${not empty imgHasBindError ? 'is-invalid':''}"
                                                    type="file" id="productFile" accept=".png, .jpg, .jpeg"
                                                    name="hoidanitFile" path="image" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>

                                            <!-- btn submit create product  -->
                                            <div class="col-md-4">
                                                <button type=" submit" class="btn btn-primary">Create</button>
                                            </div>
                                            <!-- end  -->
                                        </form:form>
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
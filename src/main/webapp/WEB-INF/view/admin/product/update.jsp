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

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${product.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

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
                            <a href="/admin/product">Product</a>
                            <span>/</span>
                            <span>Update</span>
                        </ol>
                        <main>
                            <div class="container mt-3">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3 class="d-inline-block">Update Product: ${product.name}</h3>
                                            <a href="/admin/product" class="btn btn-warning px-4">back</a>
                                        </div>
                                        <hr>

                                        <form:form class="row g-3" method="post" action="/admin/product/update"
                                            modelAttribute="product" enctype="multipart/form-data">

                                            <!-- c:set  -->
                                            <c:set var="nameHasBindError">
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="priceHasBindError">
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="deDescHasBindError">
                                                <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="soDescHasBindError">
                                                <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="quaHasBindError">
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </c:set>
                                            <!-- end  -->

                                            <div class="col-md-12 col-12" style="display: none;">
                                                <label class="form-label">ID: </label>

                                                <form:input class="form-control id" path="id" value="${product.id}" />

                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Name: </label>

                                                <form:input
                                                    class="form-control ${not empty nameHasBindError ? 'is-invalid':''}"
                                                    path="name" type="text" value="${product.name}" />

                                                ${nameHasBindError}

                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Price: </label>

                                                <form:input type="number"
                                                    class="form-control ${not empty priceHasBindError ? 'is-invalid':''}"
                                                    id="exampleInputPassword1" path="price" value="${product.price}" />

                                                ${priceHasBindError}

                                            </div>

                                            <div class="col-md-12 col-12">
                                                <label class="form-label">Detail description: </label>

                                                <form:textarea
                                                    class="form-control ${not empty deDescHasBindError ? 'is-invalid':''}"
                                                    path="detailDesc" rows="2" value="${product.detailDesc}" />

                                                ${deDescHasBindError}

                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Short description: </label>

                                                <form:input type="text"
                                                    class="form-control ${not empty soDescHasBindError ? 'is-invalid':''}"
                                                    path="shortDesc" value="${product.shortDesc}" />

                                                ${soDescHasBindError}

                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Quantity: </label>

                                                <form:input type="number"
                                                    class="form-control ${not empty quaHasBindError ? 'is-invalid':''}"
                                                    path="quantity" value="${product.quantity}" />

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

                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Image:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="hoidanitFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>

                                            <!-- btn submit create product  -->
                                            <div class="col-md-4">
                                                <button type="submit" class="btn btn-success">Update</button>
                                            </div>
                                            <!-- end  -->

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
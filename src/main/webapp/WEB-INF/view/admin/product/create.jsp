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
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
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
                            <span>product</span>
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
                                        <form class="row g-3" method="post" action="/admin/user/create"
                                            modelAttribute="newUser" enctype="multipart/form-data">
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Name: </label>
                                                <input type="email" class="form-control email" id="exampleInputEmail1"
                                                    aria-describedby="emailHelp" path="name" />
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Price: </label>
                                                <input type="number" class="form-control password"
                                                    id="exampleInputPassword1" value="0.0" path="price" />
                                            </div>
                                            <div class="col-md-12 col-12">
                                                <label class="form-label">Detail description: </label>
                                                <textarea class="form-control" path="detailDesc" rows="2"></textarea>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Short description: </label>
                                                <input type="text" class="form-control" path="shortDesc" />
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label">Quantity: </label>
                                                <input type="number" class="form-control" path="quantity" value="0" />
                                            </div>

                                            <div class="col-md-6 col-12">
                                                <label class="form-label role">Factory </label>
                                                <select class="form-select" path="factory">
                                                    <option value="Apple (MacBook)">Apple (MacBook)</option>
                                                    <option value="Asus">Asus</option>
                                                    <option value="Lenovo">Lenovo</option>
                                                    <option value="Dell">Dell</option>
                                                    <option value="LG">LG</option>
                                                    <option value="Acer">Acer</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label role">Target: </label>
                                                <select class="form-select" path="target">
                                                    <option value="Gaming">Gaming</option>
                                                    <option value="Sinh viên-Văn phòng">Sinh viên-Văn phòng</option>
                                                    <option value="Thiết kế đồ hoạ">Thiết kế đồ hoạ</option>
                                                    <option value="Mỏng nhẹ">Mỏng nhẹ</option>
                                                    <option value="Doanh nhân">Doanh nhân</option>
                                                </select>
                                            </div>

                                            <div class="col-md-8 col-12">
                                                <label for="avatarFile" class="form-label">Image: </label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="hoidanitFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>
                                            <div class="col-md-4">
                                                <button type=" submit" class="btn btn-primary">Create</button>
                                            </div>
                                        </form>
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
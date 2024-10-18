<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

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
                            <a href="/admin/user">User</a>
                            <span>/</span>
                            <span>Create</span>
                        </ol>
                        <main>
                            <div class="container mt-1">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Create a user</h3>
                                        <hr>
                                        <form:form class="row g-3" method="post" action="/admin/user/create"
                                            modelAttribute="newUser" enctype="multipart/form-data">
                                            <div class="col-md-6 col-12">
                                                <c:set var="errorsEmail">
                                                    <form:errors path="email" cssClass="text-danger" />
                                                </c:set>
                                                <label class="form-label">Email address: </label>
                                                <form:input type="email"
                                                    class="form-control ${not empty errorsEmail ? 'is-invalid' : ''} email"
                                                    id="exampleInputEmail1" aria-describedby="emailHelp" path="email" />

                                                ${errorsEmail}

                                            </div>
                                            <div class="col-md-6 col-12">
                                                <c:set var="errorsPassword">
                                                    <form:errors path="password" cssClass="text-danger" />
                                                </c:set>
                                                <label class="form-label">Password: </label>
                                                <form:input type="password"
                                                    class="form-control ${not empty errorsPassword ? 'is-invalid' : '' } password"
                                                    id="exampleInputPassword1" path="password" />

                                                ${errorsPassword}

                                            </div>
                                            <div class="col-md-6 col-12">
                                                <label class="form-label phone">Phone Number: </label>
                                                <form:input class="form-control password" path="phone" />
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <c:set var="errorFullName">
                                                    <form:errors path="fullName" cssClass="text-danger" />
                                                </c:set>
                                                <label class="form-label">Full Name: </label>
                                                <form:input class="form-control ${not empty errorFullName?'
                                                    is-invalid':''} fullName" path="fullName" />

                                                ${errorFullName}
                                            </div>
                                            <div class="col-md-12 col-12">
                                                <label class="form-label address">Address: </label>
                                                <form:input class="form-control password" path="address" />
                                            </div>
                                            <div class="col-md-4 col-12">
                                                <label class="form-label role">Role: </label>

                                                <form:select class="form-select" path="role.name">
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>

                                            </div>

                                            <div class="col-md-8 col-12">
                                                <label for="avatarFile" class="form-label">Avatar: </label>
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Register - SB Admin</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="bg-primary">
                    <div id="layoutAuthentication">
                        <div id="layoutAuthentication_content">
                            <main>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-7">
                                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                <div class="card-header">
                                                    <h3 class="text-center font-weight-light my-4">Login</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form method="post" action="/register">
                                                        <!-- c:set   -->

                                                        <!-- end  -->

                                                        <div class="form-floating mb-3">
                                                            <input path="email"
                                                                class="form-control ${not empty errorEmail ? 'is-invalid':''}"
                                                                id="inputEmail" type="email"
                                                                placeholder="name@example.com" />
                                                            <label for="inputEmail">Email address</label>

                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <input path="password"
                                                                        class="form-control ${not empty errorPassword ? 'is-invalid':''}"
                                                                        id="inputPassword" type="password"
                                                                        placeholder="Create a password" />
                                                                    <label for="inputPassword">Password</label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 w-100">
                                                            <button type=" submit"
                                                                class="btn btn-primary w-100">Login</button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="card-footer text-center py-3">
                                                    <div class="small">
                                                        <a href="/register">
                                                            Do'nt have an account? Go to register
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>


                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>
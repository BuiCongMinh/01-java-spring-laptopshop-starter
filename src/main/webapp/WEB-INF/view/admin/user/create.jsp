<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>

            </head>

            <body>
                <div class="container mt-3">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Create a user</h3>
                            <hr>
                            <form:form method="post" action="/admin/user/create1" modelAttribute="newUser">
                                <div class="mb-3">
                                    <label class="form-label">Email address</label>
                                    <form:input type="email" class="form-control email" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" path="email" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <form:input type="password" class="form-control password" id="exampleInputPassword1"
                                        path="password" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <form:input class="form-control fullName" path="fullName" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label address">Address</label>
                                    <form:input class="form-control password" path="address" />
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


            </body>

            </html>
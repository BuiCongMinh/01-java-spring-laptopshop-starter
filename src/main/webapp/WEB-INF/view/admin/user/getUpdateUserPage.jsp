<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update User ${userId.fullName}</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"> </script>
            </head>

            <body>

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
                                    <form:input class="form-control email" type="email" path="email" disabled="true" />
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

            </body>

            </html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - Laptopshop</title>

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

            </head>

            <body>

                <div class="container">
                    <div class="bg-danger text-white my-4 rounded-pill d-flex align-items-center justify-content-center"
                        style=" height: 70px;">
                        <span class="fs-5">Bạn ko có quyền truy cập vào trang admin !</span>
                    </div>
                    <a href="/" class="btn-success p-3 rounded-1">
                        Bấm vào đây để quay trở lại trang chủ !
                    </a>
                </div>

                <!-- JavaScript Libraries -->

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>
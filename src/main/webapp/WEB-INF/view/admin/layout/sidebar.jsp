<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <% String currentUrl=request.getRequestURL().toString(); %>
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Features</div>

                            <a class='nav-link <%= currentUrl.contains("/admin/user") ? "active" : " " %> '
                                href="/admin/user">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                User
                            </a>

                            <a class='nav-link <%= currentUrl.contains("/admin/product") ? "active" : " " %> '
                                href="/admin/product">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Product
                            </a>

                            <a class='nav-link <%= currentUrl.contains("/admin/order") ? "active" : " " %> '
                                href="/admin/order">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Order
                            </a>

                        </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Minhvn
                </div>
            </nav>
        </div>
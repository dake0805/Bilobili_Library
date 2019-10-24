<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Librarian" %>
<%@ page import="entity.Book" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

    <script src="js/dialogue.js"></script>
</head>
<body>
<div class="page">
    <!-- Main Navbar-->
    <jsp:include page="header_template.jsp" flush="true"></jsp:include>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <jsp:include page="reader_side.jsp" flush="true"></jsp:include>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">orderdetail</h2>
                </div>
            </header>
            <!-- Breadcrumb-->
            <div class="breadcrumb-holder container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                    <li class="breadcrumb-item active"></li>
                </ul>
            </div>


            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>Bnumber</th>
                                            <th>id</th>
                                            <th>state</th>
                                            <th>floor</th>
                                            <th>shelf</th>
                                            <th>areacode</th>
                                            <th>Order</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            request.getAttribute("wa");
                                        %>
                                        <c:forEach items="${wa}" var="detail" varStatus="li">
                                            <tr>
                                                <td>${detail.getBookNumber()}</td>
                                                <td>${detail.getCopyid()}</td>
                                                <td>
                                                    <c:if test="${detail.getState()==0}">borrowed</c:if>
                                                    <c:if test="${detail.getState()==1}">ordered</c:if>
                                                    <c:if test="${detail.getState()==2}">vacant</c:if></td>
                                                    <%--<c:otherwise><form  style="margin: 10px;position: relative" action="Order"
                                                           name="search" method="post">
                                                        <input type="hidden" name="number" value="" />

                                                        <input type="submit" value="Order">
                                                    </form> </c:otherwise> --%>
                                                <td>${detail.getFloor()}</td>
                                                <td>${detail.getShelf()}</td>
                                                <td>${detail.getAreacode()}</td>
                                                <td>
                                                    <form style="margin: 10px;position: relative" action="Orderto"
                                                          name="" method="post">
                                                        <input type="hidden" name="number" value="${detail.getState()}">
                                                        <input type="hidden" name="sa" value="${detail.getBookNumber()}">
                                                        <input type="hidden" name="id" value="${detail.getCopyid()}">
                                                        <input type="submit" value="Order"></form>
                                                   <%-- <%
                                                        String errorInfo = (String)request.getAttribute("loginError");
                                                        if(errorInfo != null) {
                                                    %>
                                                    <script type="text/javascript" language="javascript">
                                                        alert("<%=errorInfo%>");
                                                    </script>

                                                    <%
                                                    }
                                                %>--%>


                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <%
                                        String errorInfo = (String)request.getAttribute("loginError");
                                        if(errorInfo != null) {
                                    %>
                                    <script type="text/javascript" language="javascript">
                                        alert("<%=errorInfo%>");
                                    </script>

                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Page Footer-->
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Copyright &copy; 2019.Company name All rights reserved.More Templates test</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p></p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>


<script>
    var info = '<%=request.getParameter("info")%>';
    if (info == 'found') {
        alert("successfully serach!");
    } else if (info == 'notFound') {
        alert("search failure!");
    }
</script>


<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="js/charts-home.js"></script>
<!-- Main File-->
<script src="js/front.js"></script>

</body>
</html>
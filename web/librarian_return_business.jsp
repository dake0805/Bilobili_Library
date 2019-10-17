<%--
  Created by IntelliJ IDEA.
  User: 刘威
  Date: 2019/10/17
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.ReaderBorrow" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<div class="page">
    <!-- Main Navbar-->
    <jsp:include page="header_template.jsp" flush="true"></jsp:include>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <jsp:include page="librarian_side.jsp" flush="true"></jsp:include>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">View Borrowing Information</h2>
                </div>
            </header>
            <!-- Breadcrumb-->
            <div class="breadcrumb-holder container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="reader_borrowHistory.jsp">Home</a></li>
                    <li class="breadcrumb-item active">View</li>
                </ul>
            </div>

            <%--显示借阅记录 --%>
            <section class="tables" style="padding: 20px">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Reader Account</th>
                                                <th>Book Copy ID</th>
                                                <th>Borrow Time</th>
                                                <th>Status</th>
                                                <th>Fine</th>
                                                <th>Option</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%List<ReaderBorrow> readerBorrowList = (List<ReaderBorrow>) request.getAttribute("readerBorrowList");%>
                                            <c:forEach items="${readerBorrowList}" var="readerBorrow" varStatus="li">
                                                <tr>
                                                    <th>${li.index+1}</th>
                                                    <td>${readerBorrow.getUser_account()}</td>
                                                    <td>${readerBorrow.getCopy_id()}</td>
                                                    <td>${readerBorrow.getBorrow_time().toString()}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${readerBorrow.getIsReturned() ==1}">
                                                                Returned
                                                            </c:when>
                                                            <c:otherwise>
                                                                Not Returned
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${readerBorrow.getFine().toString()}$</td>
                                                    <td>
                                                        <a href="ReturnBook.do?book_copy_id=${readerBorrow.getCopy_id()}&user_account=${readerBorrow.getUser_account()}">
                                                            <button type="button" class="btn btn-primary">Return
                                                            </button>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Page Footer-->
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Copyright &copy; 2019. <a
                                    href="http://www.cssmoban.com/" target="_blank" title=""></a>
                                <a href="http://www.cssmoban.com/" title="" target="_blank"></a></p>
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
    if (info == "return_success") {
        alert("Successfully Return!");
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

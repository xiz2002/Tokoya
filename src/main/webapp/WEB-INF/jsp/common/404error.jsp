<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>404Error</title>
	<link href="<c:url value="/css/bootstrap/bootstrap.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/font-awesome/font-awesome.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/nprogress/nprogress.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/admin/custom.css"/>" rel="stylesheet">
  
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <h1 class="error-number">404</h1>
              <h2>Sorry but we couldn't find this page</h2>
              <p>This page you are looking for does not exist <a href="#">Report this?</a>
              </p>
              <div class="mid_center">
                <h3>Search</h3>
                <form>
                  <div class="col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search for...">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>
	
    <!-- jQuery -->
    <script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
    <!-- Bootstrap -->
    <script src="<c:url value="/js/bootstrap/bootstrap.js"/>"></script>
    <!-- NProgress -->
    <script src="<c:url value="/js/nprogress/nprogress.js"/>"></script>

    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/js/admin/custom.js"/>"></script>
  </body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/8/2023
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">
</head>
<body>
<section class="vh-100" style="background-color:white;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://images.unsplash.com/photo-1486012563054-a205a26e389b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; min-height: 100%" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center" style="background-color: #d3c1b9">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form method="post">

                                    <div class="d-flex align-items-center mb-3 pb-1" style="margin-left:20%">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                        <span class="h1 fw-bold mb-0" >Simple Booking</span>
                                    </div>

                                    <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px; font-weight: bold">Sign up now</h4>

                                    <div class="form-outline mb-4">
                                        <input name="user" type="text" id="form2Example17" class="form-control form-control-lg" placeholder="Enter here"/>
                                        <label class="form-label" for="form2Example17">User name</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input name="password" type="password" id="form2Example27" class="form-control form-control-lg" placeholder="Enter here" />
                                        <label class="form-label" for="form2Example27">Password</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input name="repeat-password" type="password" id="form2Example37" class="form-control form-control-lg" placeholder="Enter here" />
                                        <label class="form-label" for="form2Example37">Repeat Password</label>
                                    </div>
                                     <p class="text-bg-danger" style="text-align: center">${alert}</p>
                                     <p class="text-bg-danger" style="text-align: center">${message}</p>
                                     <p class="text-bg-danger" style="text-align: center">${error}</p>
                                     <p class="text-bg-light" style="text-align: center">${success}</p>
                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit">Sign up</button>
                                    </div>

                                    <a class="small text-muted" href="/account?action=reset">Forgot password?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Do you already have an account? <a href="/account?action=login" style="color: #393f81;">Login here</a></p>
                                    <a href="/account?action=home" class="small text-muted">Back to home page.</a>
                                    <a href="#!" class="small text-muted">Privacy policy</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>

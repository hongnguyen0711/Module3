package com.example.ss10_jsp_servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customers> customersList = new ArrayList<>();
        Customers customer1 = new Customers("Nguyễn Văn A", "12/20/2020","06 Chế Lan Viên", "https://thuthuatnhanh.com/wp-content/uploads/2021/02/Avatar-ngau-dep.jpg");
        Customers customer2 = new Customers("Nguyễn Văn B", "12/20/2020","06 Chế Lan Viên", "https://thuthuatnhanh.com/wp-content/uploads/2021/02/Avatar-ngau-dep.jpg");
        Customers customer3 = new Customers("Nguyễn Văn C", "12/20/2020","06 Chế Lan Viên", "https://thuthuatnhanh.com/wp-content/uploads/2021/02/Avatar-ngau-dep.jpg");
        Customers customer4 = new Customers("Nguyễn Văn D", "12/20/2020","06 Chế Lan Viên", "https://thuthuatnhanh.com/wp-content/uploads/2021/02/Avatar-ngau-dep.jpg");
        Customers customer5 = new Customers("Nguyễn Văn E", "12/20/2020","06 Chế Lan Viên", "https://thuthuatnhanh.com/wp-content/uploads/2021/02/Avatar-ngau-dep.jpg");
        customersList.add(customer1);
        customersList.add(customer2);
        customersList.add(customer3);
        customersList.add(customer4);
        customersList.add(customer5);
        request.setAttribute("customer", customersList);
        request.getRequestDispatcher("info.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
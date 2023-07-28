package com.example.product_discount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalculator", value = "/calculator")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Float.parseFloat(request.getParameter("price"));
        double percent = Float.parseFloat(request.getParameter("percent"));
        double discountAmount = price * percent * 0.01;
        double discountPrice = price - discountAmount;
        request.setAttribute("price", price);
        request.setAttribute("percent", percent);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("result.jsp").forward(request,response);

//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<h2>price:" + price + "</h2>");
//        writer.println("<h2>percent:" + percent + "</h2>");
//        writer.println("<h2>discountAmount:" + discountAmount + "</h2>");
//        writer.println("<h2>discountPrice:" + discountPrice + "</h2>");
//        writer.println("</html>");
    }
}
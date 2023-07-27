package com.example.ss10_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Calculate", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double fistOperand = Double.parseDouble(request.getParameter("operand"));
        String operater = request.getParameter("operator");
        double secondOperand = Double.parseDouble(request.getParameter("operand1"));
        double result = 0;
        try {
            switch (operater) {
                case "Addition":
                    result = fistOperand + secondOperand;
                    break;
                case "Subtraction":
                    result = fistOperand - secondOperand;
                    break;
                case "Multiplication":
                    result = fistOperand * secondOperand;
                    break;
                case "Division":
                    if (secondOperand !=0) {
                        result = fistOperand / secondOperand;
                    } else {
                        throw new RuntimeException("can't not divide by 0");
                    }
                    break;
            }
        } catch (Exception e){
            e.getMessage();
        }
        request.setAttribute("fistOperand", fistOperand);
        request.setAttribute("secondOperand", secondOperand);
        request.setAttribute("result", result);
        request.getRequestDispatcher("calculator.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
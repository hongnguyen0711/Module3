package servlet;

import model.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand  = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);

        try {
            float result = Calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("firstOperand",firstOperand);
            request.setAttribute("secondOperand",secondOperand);
            request.setAttribute("operator",operator);
            request.setAttribute("result",result);
        }catch (Exception e){
            String str = "Error: " + e.getMessage();
            request.setAttribute("error",str);
        }
        request.getRequestDispatcher("display.jsp").forward(request,response);

    }
}
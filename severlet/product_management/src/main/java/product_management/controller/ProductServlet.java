package product_management.controller;

import product_management.model.Product;
import product_management.service.IProductService;
import product_management.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    IProductService service = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                break;
            case "view":
                break;
            default:
                listProduct(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                break;
            default:

        }
    }


    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = new ArrayList<>(service.findAll().values());
        request.setAttribute("products", productList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) (Math.random() * 100);
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        int status = Integer.parseInt(request.getParameter("status"));

        Product product = new Product(id, name, price, description, producer, status);
        service.save(product);
        request.setAttribute("message", "New product was created");
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.findById(id);
        try {
            if (product == null) {
                request.getRequestDispatcher("view/error-404.jsp").forward(request, response);
            } else {
                request.setAttribute("product", product);
                request.getRequestDispatcher("view/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        int status = Integer.parseInt(request.getParameter("status"));
        Product product = service.findById(id);

        try {
            if (product == null) {
                request.getRequestDispatcher("view/error-404.jsp").forward(request, response);
            } else {
                product.setName(name);
                product.setPrice(price);
                product.setDescription(description);
                product.setProducer(producer);
                product.setStatus(status);
                service.update(id, product);
                request.setAttribute("product", product);
                request.setAttribute("message", "Product information was updated");
                request.getRequestDispatcher("view/edit.jsp").forward(request,response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

}
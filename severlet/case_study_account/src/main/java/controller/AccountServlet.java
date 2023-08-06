package controller;

import model.Account;
import model.Role;
import service.AccountService;
import service.IAccountService;
import service.IRoleService;
import service.RoleService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    IAccountService service = new AccountService();
    IRoleService roleService = new RoleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signup":
                showSignUp(request, response);
                break;
            case "login":
                showLogin(request, response);
                break;
            case "home":
                showMenu(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "manage":
                showManage(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;
            case"reset":
                showReset(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showReset(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("views/reset.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signup":
                signUp(request, response);
                break;
            case "login":
                loginUser(request, response);
                break;
            case "edit":
                editAccount(request, response);
                break;
            case "create":
                createAccount(request, response);
                break;
            case "delete":
                deleteAccount(request, response);
                break;
            default:

        }
    }


    private void showLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) {
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        Account account = service.login(user, password);
        try {
            if (account == null) {
                request.setAttribute("message", " Wrong username or password!");
                request.getRequestDispatcher("views/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                response.sendRedirect("index.jsp");

            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showSignUp(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("views/sign_up.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("user");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeat-password");
        try {
            if (userName.equals("") || password.equals("")) {
                request.setAttribute("alert", "Please enter all information!");
                request.getRequestDispatcher("views/sign_up.jsp").forward(request, response);
            }
            if (password.equals(repeatPassword)) {
                Account account = service.checkAccount(userName);
                if (account != null) {
                    request.setAttribute("error", "Account already exists!");
                    request.getRequestDispatcher("views/sign_up.jsp").forward(request, response);
                } else {
                    service.signUp(userName, password);
                    request.setAttribute("success", "Sign Up Success");
                    request.getRequestDispatcher("views/sign_up.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Passwords are not the same!");
                request.getRequestDispatcher("views/sign_up.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showMenu(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showManage(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("views/manage.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Account> accountList = new ArrayList<>(service.getAll().values());
        request.setAttribute("accounts", accountList);
        try {

            request.getRequestDispatcher("views/listAccount.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Account account = service.findById(id);
        List<Role> role = roleService.getRole();
        try {
            if (account == null) {
                request.getRequestDispatcher("views/error.jsp").forward(request, response);
            } else {
                request.setAttribute("role", role);
                request.setAttribute("account", account);
                request.getRequestDispatcher("views/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("user");
        String passWord = request.getParameter("pass");
        int status = Integer.parseInt(request.getParameter("status"));
        int role = Integer.parseInt(request.getParameter("role"));

        List<Role> role1 = roleService.getRole();
        Account account = service.findById(id);
        Account account1 = service.findByName(userName);
        try {
            if (account == null) {
                request.getRequestDispatcher("views/error.jsp").forward(request, response);
            } else if (account1 != null) {
                request.setAttribute("role", role1);
                request.setAttribute("account", account);
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("views/edit.jsp").forward(request, response);
            } else {
                account.setUsername(userName);
                account.setPassword(passWord);
                account.setStatus(status);
                account.setRole(role);

                service.editAccount(id, account);
                request.setAttribute("role", role1);
                request.setAttribute("account", account);
                request.setAttribute("message", "Account was updated");
                request.getRequestDispatcher("views/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Role> role = roleService.getRole();
            request.setAttribute("newRole", role);
            request.getRequestDispatcher("views/create.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("user");
        String passWord = request.getParameter("pass");
        int status = Integer.parseInt(request.getParameter("status"));
        int role = Integer.parseInt(request.getParameter("role"));

        Account account = service.findByName(userName);
        try {
            if (account != null) {
                List<Role> role1 = roleService.getRole();
                request.setAttribute("newRole", role1);
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("views/create.jsp").forward(request, response);
            } else {
                Account newAccount = new Account(userName, passWord, status, role);
                service.createAcction(newAccount);

                request.setAttribute("account", newAccount);
                request.setAttribute("message", "Success");
                request.getRequestDispatcher("views/create.jsp").forward(request, response);
            }

        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Account account = service.findById(id);
        try {
            if (account == null) {
                request.getRequestDispatcher("views/error.jsp").forward(request, response);
            }else {
                service.deleteAccount(id,true);
                response.sendRedirect("/account");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }
}
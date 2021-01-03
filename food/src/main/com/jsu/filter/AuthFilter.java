package jsu.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter",
        urlPatterns = {"/*"},
        initParams={
                @WebInitParam(name="index",value = "index.jsp"),
                @WebInitParam(name="login",value = "login.jsp"),
                @WebInitParam(name="loginServlet",value = "UserLoginServlet"),
                @WebInitParam(name="register",value ="register.jsp"),
                @WebInitParam(name="registerServlet",value = "UserRegisterServlet"),
        }
)
public class AuthFilter implements Filter {
    private FilterConfig config;

    public void init(FilterConfig config) throws ServletException {

        //http://localhost:8080/test/UsermangerServlet
        this.config=config;
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;

        //判断用户是否登录
        HttpSession session=request.getSession();
        Object user=session.getAttribute("SESSION_LOGIN");

        //资源放行，index.jsp首页，login.jsp登录页，loninServlet
        //获取请求的url http://localhost:8080/chapter10/test.jsp
        String path=request.getServletPath();

        //获取参数
        String index=config.getInitParameter("index");
        String login=config.getInitParameter("login");
        String loginServlet=config.getInitParameter("loginServlet");
        String registerServlet=config.getInitParameter("registerServlet");
        String register=config.getInitParameter("register");


        if(user!=null||path.contains(index)|| path.contains("images")||path.contains(".css")||path.contains(".js")||path.contains(login)||path.contains(loginServlet)||path.contains(registerServlet)||path.contains(register)) {
            chain.doFilter(req, resp);
            } else {
                response.sendRedirect("index.jsp");
            }
        }


    public void destroy() {
    }

}

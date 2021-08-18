package three.team.movie.interceptor;

import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class AuthInterceptor extends WebContentInterceptor {

    /**
     * 세션에 계정정보(SessionVO)가 있는지 여부로 인증 여부를 체크한다. 계정정보(SessionVO)가 없다면, 로그인 페이지로 이동한다.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
    	
    	System.out.println("AuthInterceptor");
    	
        return true;
    }
}
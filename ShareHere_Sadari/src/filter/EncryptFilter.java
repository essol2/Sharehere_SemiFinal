package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.EncryptWrapper;


// 이 필터는 암호화가 필요한 서블릿에만 적용이 되기 때문에
// InsertMemberServlet, LoginServlet, UpdatePwdServlet 에 필터 적용이 되어야 함
@WebFilter(filterName = "encrypt", servletNames = {"InsertHostServlet",
													"InsertUserServlet",
													"LoginServlet",
													"UpdatePwdServlet",
													"DeleteMemberServlet"})
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// System.out.println("암호화 필터 작동");
		// Wrapper : 필터에서 넘어온 request, response 를 변경할 때 사용
		// request나 response를 특정한 형태로 감싸서 변형
		
		// place your code here
		EncryptWrapper encWrapper = new EncryptWrapper((HttpServletRequest)request);
		// 매개변수로 받아온 ServletRequest를 HttpServletRequest로 다운캐스팅하여
		// Wrapper의 생성자로 전달
		
		
		// pass the request along the filter chain
//		chain.doFilter(request, response);
		chain.doFilter(encWrapper, response);
		
		// 3개의 요청에 대해서 request.getParameter(key)를 수행하면
		// EncryptWrapper에 오버라이딩 된 getParameter 메소드가 실행 되고
		// userPwd라는 값은 평문이 아닌 가공된 문자로 보일 것
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

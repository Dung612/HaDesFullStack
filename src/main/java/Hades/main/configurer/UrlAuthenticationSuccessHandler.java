package Hades.main.configurer;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		handle(request , response , authentication);
		ClearAuthenticationAttributes(request);
		
	}
	
	private void ClearAuthenticationAttributes(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session == null) {
			return ;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

	private void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		// TODO Auto-generated method stub
		String targetUrl = determineTargetUrl(authentication);
		
		if(response.isCommitted()) {
			return;
		}
		
		redirectStraregy.sendRedirect(request, response, targetUrl);
		//dieu huong targer URL
	}
//lay role cua user 
	private String determineTargetUrl(final Authentication authentication) throws IllegalStateException {
		
		Map<String, String> roleTargetUrlMap = new HashMap<String, String>();
		//key la role name , value la url(action)
		roleTargetUrlMap.put("ADMIN", "/admin/home");
		roleTargetUrlMap.put("Guest", "/index");
		
		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); //lay danh sach cac roles
		for (final GrantedAuthority grantedAuthority : authorities) {
			//
			String authorityName = grantedAuthority.getAuthority();
			
			if (roleTargetUrlMap.containsKey(authorityName)) {
				//syso "authorityName: " + authorityName
				//syso "role url map: " + roleTargetUrlMap.get(authorityName).toString()
				return roleTargetUrlMap.get(authorityName);
				//tra ve target url cua user dang nhap
				
			}
		}
		throw new IllegalStateException();
		
		
	}

	//dieu huong den request
	private RedirectStrategy redirectStraregy = new DefaultRedirectStrategy();

}

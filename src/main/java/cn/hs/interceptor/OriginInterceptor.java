package cn.hs.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OriginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

        // 允许跨域，允许跨域Cookie
        String origin = request.getHeader("Origin");

        if (null != origin){
            response.setHeader("Access-Control-Allow-Credentials", "true");
            response.setHeader("Access-Control-Allow-Origin", origin);
            // json数据类型需要明确指定允许的请求头
            response.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        }
//        else {
//            response.setHeader("Access-Control-Allow-Origin", "*");
//        }

        return true;
    }

}

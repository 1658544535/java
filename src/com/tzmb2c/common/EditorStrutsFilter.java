package com.tzmb2c.common;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * 
 * 百度编辑器过滤器
 * 
 * @author EricChen
 * 
 */
public class EditorStrutsFilter extends StrutsPrepareAndExecuteFilter {
  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest) req;
    String url = request.getRequestURI();
    System.out.println(url);
    if (url.contains("/jsp/")) {
      chain.doFilter(req, res);
    } else {
      super.doFilter(req, res, chain);
    }
  }
}

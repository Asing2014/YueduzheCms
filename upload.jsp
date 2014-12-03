<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="util.FreeMarkertUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
Map map = new HashMap();
map.put("type", request.getParameter("type"));
map.put("msg", request.getParameter("msg"));
FreeMarkertUtil.analysisTemplate(request,response,"upload.ftl", "utf-8", map);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<s:iterator value="myActivities" var="a">
						<tr>
										<td><a href="detail?aid=${a.a_id }&phone=${user.u_phone}">${a.a_name }</a></td>
										<td>${a.startDate } —— ${a.endDate }</td>
										<td>${a.village.v_name }</td>
										<td>${a.currentPeople }</td>
										<td><button class="btn btn-danger delrecord"
												type="button" onclick="window.location.href='detail?aid=${a.a_id }&phone=${user.u_phone}'">查看记录</button></td>
									</tr>
									</s:iterator>
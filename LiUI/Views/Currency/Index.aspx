﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Zippy.Data.Collections.PaginatedList<EAP.Bus.Entity.Currency>>" %>

<%@ Import Namespace="EAP.Bus.Entity" %>
<%@ Import Namespace="EAP.Bus.Entity.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	币种
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		var pageSize = <%=ViewData["PageSize"] %>;
		var controller = "/Currency";
		var sortUrl = "<%=Model.ToSortUrl() %>";

		$(function () {
			$("#bQuery").click(function () {
				window.location.href = controller + '/?PageSize=' + pageSize 
										+ "&qID=" + encodeURIComponent($("#qID").val())
										+ "&qTitle=" + encodeURIComponent($("#qTitle").val())
										+ "&qCreateDateStart=" + encodeURIComponent($("#qCreateDateStart").val())
										+ "&qCreateDateEnd=" + encodeURIComponent($("#qCreateDateEnd").val())
;
										
			});
		});
	</script>
	<script type="text/javascript" src="/content/scripts/pagemvc.js"></script>
	<div id="contents">
		<div id="top">
			<div class="con clearfix">
				<div class="fl">
					<%=ViewData["TopMenu"] %>
				</div>
				<div class="pop-box pop-query w600" rel="search">
					<div class="con">
						<a rel="close" class="close mr10" href="javascript:;">关闭</a>
						<div class="msg-box msg-contents">
							<table class="query">
								<tr>
									<td class='tt'>
										英文简称：
									</td>
									<td class='tc'>
										<input type='text' class='text' id='qID' />
									</td>
									<td class='tt'>
										标题：
									</td>
									<td class='tc'>
										<input type='text' class='text' id='qTitle' />
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td class='tt'>
										创建时间：
									</td>
									<td class='tc'>
										<input type='text' class='text' id='qCreateDateStart' />
										-
										<input type='text' class='text' id='qCreateDateEnd' />
									</td>
									<td>
									</td>
									<td>
									</td>
									<td>
									</td>
								</tr>
							</table>
						</div>
						<div class="bottom">
							<a class="jenter button" href="javascript:;" id='bShowAll'>显示全部<b></b></a> <a class="jenter button active"
								href="javascript:;" id='bQuery'>查询<b></b></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="main">
			<%
				var orCol = Request["orderCol"];
				int iorCol = orCol.ToInt32();
			%>
			<table cellspacing="0" cellpadding="0" border="0" rel="main" class="list-table">
				<tr rel="title">
					<th width="20">
						<input type="checkbox" rel="check">
					</th>
					<th>
						标题
						<% if (iorCol == 3)
						   { %>
						<i title="点击排序" class="icon i_sort i_asc" rel="4"></i>
						<%}
						   else if (iorCol == 4)
						   { %>
						<i title="点击排序" class="icon i_sort i_desc" rel="3"></i>
						<%}
						   else
						   { %>
						<i title="点击排序" class="icon i_sort i_nosort" rel="3"></i>
						<%} %>
					</th>
					<th>
						英文简称
						<% if (iorCol == 1)
						   { %>
						<i title="点击排序" class="icon i_sort i_asc" rel="2"></i>
						<%}
						   else if (iorCol == 2)
						   { %>
						<i title="点击排序" class="icon i_sort i_desc" rel="1"></i>
						<%}
						   else
						   { %>
						<i title="点击排序" class="icon i_sort i_nosort" rel="1"></i>
						<%} %>
					</th>
					<th style="width:150px">
						创建时间
						<% if (iorCol == 5)
						   { %>
						<i title="点击排序" class="icon i_sort i_asc" rel="6"></i>
						<%}
						   else if (iorCol == 6)
						   { %>
						<i title="点击排序" class="icon i_sort i_desc" rel="5"></i>
						<%}
						   else
						   { %>
						<i title="点击排序" class="icon i_sort i_nosort" rel="5"></i>
						<%} %>
					</th>
					<th class="w100">
						操作
					</th>
				</tr>
				<%
					if (Model.Count > 0)
					{
						foreach (var item in Model)
						{
						
				%>
				<tr rel="item">
					<td class="tc">
						<input type="checkbox" value="<%=item.ID %>" name='checkID' class="xID" />
					</td>
					<td>
						<%=item.Title%>
					</td>
					<td>
						<%=item.ID%>
					</td>
					<td class="tc">
						<%=item.CreateDate%>
					</td>
					<td>
						<a href="javascript:;" rel="<%=item.ID %>" class="i_xedit xedit">修改</a>
						<a href='javascript:;' rel="<%=item.ID %>" class="i_xdel xdel">删除</a>
						<a href='javascript:;' rel="<%=item.ID %>" class="i_xdetail xdetail">详情</a>
					</td>
				</tr>
				<%
					}
					}
					else
					{ %>
				<!-- 没有数据的时候显示 -->
				<tr rel="noitem">
					<td colspan="100" class="msg-box h200">
						没有任何数据
					</td>
				</tr>
				<!-- 没有数据的时候显示 -->
				<%} %>
			</table>
		</div>
	</div>
	<div id="bottom">
		<%=Model.ToPagerHtml() %>
	</div>
</asp:Content>

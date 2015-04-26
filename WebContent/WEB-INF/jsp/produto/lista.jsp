<%@page import="br.com.caelum.produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>

	<h1>Produtos</h1>
	<div id="mensagem">
		<fmt:message key="mensagem.bemvindo"/>
	</div>
	<table width="100%">
		<tr>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
			<td>contador</td>
		</tr>
		<c:forEach items="${produtoList}" var="produto" varStatus="st"> 
			<tr id="produto{produto.id}>">
				<td>${produto.nome.toUpperCase()}</td>
				<td>
					<fmt:formatNumber value="${produto.preco}" type="currency"/>
				</td>
				<td>${produto.descricao}</td>
				<td>
					<fmt:formatDate value="${produto.dataInicioVenda.time}" pattern="EEEE, dd 'de' MMMM 'de' yyyy"/>
				</td>				
				
				<c:choose>
					<c:when test="${produto.usado}">
					<td>
						Sim
					</td>
					</c:when>
					
					<c:when test="${ not produto.usado}">
					<td>
						Não
					</td>
					</c:when>
				
				</c:choose>
				<td><a href="#" onclick="return removeProduto(${produto.id})">Remover</a></td>
				<td>${st.count}</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:url value="/produto/formulario" var="urlAddProduto"/>
	<a href="${urlAddProduto}"><fmt:message key="mensagem.novoProduto"/></a>
	
	<c:import url="../_template/rodape.jsp"/>
	
</body>
</html>
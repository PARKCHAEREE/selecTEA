<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Tea"%>
<%@ page import="dao.TeaRepository"%>

<%
    request.setCharacterEncoding("UTF-8");

    String realFolder = request.getServletContext().getRealPath("/resources/images");; 
    int maxSize = 5 * 1024 * 1024; 
    String encType = "utf-8";

    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

    
    String teaId = multi.getParameter("teaId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String country = multi.getParameter("country");
    String category = multi.getParameter("category");
    String packaging = multi.getParameter("packaging");
    String unitsInStock = multi.getParameter("unitsInStock");

    
    Integer price = 0;
    if(unitPrice != null && !unitPrice.isEmpty()) price = Integer.valueOf(unitPrice);
    
    long stock = 0;
    if(unitsInStock != null && !unitsInStock.isEmpty()) stock = Long.valueOf(unitsInStock);

   
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    
    Tea newTea = new Tea();
    newTea.setTeaId(teaId);
    newTea.setName(name);
    newTea.setUnitPrice(price);
    newTea.setDescription(description);
    newTea.setCountry(country);
    newTea.setCategory(category);
    newTea.setPackaging(packaging);
    newTea.setUnitsInStock(stock);
    newTea.setFilename(fileName);

    
    TeaRepository dao = TeaRepository.getInstance();
    dao.addTea(newTea);

    response.sendRedirect("teas.jsp");
%>
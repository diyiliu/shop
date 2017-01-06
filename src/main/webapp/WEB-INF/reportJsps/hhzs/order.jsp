<%@ page import="net.sf.jasperreports.engine.JasperFillManager" %>
<%@ page import="net.sf.jasperreports.engine.JasperPrint" %>
<%@ page import="net.sf.jasperreports.engine.JasperReport" %>
<%@ page import="net.sf.jasperreports.engine.export.HtmlExporter" %>
<%@ page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@ page import="net.sf.jasperreports.export.SimpleExporterInput" %>
<%@ page import="net.sf.jasperreports.export.SimpleHtmlExporterOutput" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.53:1521:orcl", "hhzs", "1qaz2wsx");

    File reportFile = new File(application.getRealPath("/WEB-INF/jasper/hhzs/order.jasper"));

    JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile);

    Map parameters = new HashMap();
    parameters.put("orderId", "6338053366233158061");
    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, conn);

    HtmlExporter htmlExporter = new HtmlExporter();
    htmlExporter.setExporterInput(new SimpleExporterInput(jasperPrint));
    htmlExporter.setExporterOutput(new SimpleHtmlExporterOutput(out));
    htmlExporter.exportReport();
%>
</body>
</html>

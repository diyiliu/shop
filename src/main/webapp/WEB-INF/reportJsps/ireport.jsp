<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporter" %>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter" %>
<%@ page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.view.JasperViewer" %>
<%@ page import="net.sf.jasperreports.engine.export.HtmlExporter" %>
<%@ page import="net.sf.jasperreports.export.HtmlExporterConfiguration" %>
<%@ page import="net.sf.jasperreports.export.SimpleHtmlExporterConfiguration" %>
<%@ page import="net.sf.jasperreports.export.SimpleExporterInput" %>
<%@ page import="net.sf.jasperreports.export.SimpleHtmlExporterOutput" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "123456");

    File reportFile = new File(application.getRealPath("/WEB-INF/jasper/shop1.jasper"));
    JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile);
    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);

    HtmlExporter htmlExporter = new HtmlExporter();
    htmlExporter.setExporterInput(new SimpleExporterInput(jasperPrint));
    htmlExporter.setExporterOutput(new SimpleHtmlExporterOutput(out));
    htmlExporter.exportReport();

/*   response.setContentType("application/pdf");
    ServletOutputStream outputStream = response.getOutputStream();
    JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
    outputStream.flush();
    outputStream.close();
    conn.close();*/

    /*  过时
    JRHtmlExporter exporter = new JRHtmlExporter();
    exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
    exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);

    exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
    exporter.exportReport();
    out.flush();
    conn.close();*/
%>
</body>
</html>

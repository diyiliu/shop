package com.diyiliu.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Description: HomeCotroller
 * Author: DIYILIU
 * Update: 2016-10-10 15:53
 */

@Controller
public class HomeCotroller {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        logger.debug("Home index!");
        String reqHeader = request.getHeader("user-agent");

/*        if (isMobile(reqHeader)){

            return "/guide/mobile/index";
        }

        return "/guide/index";*/
        return "index";
    }

    @RequestMapping("/hello")
    public String hello() {
        System.out.println("Hello freemarker!");

        return "/hello";
    }

    @RequestMapping("/report")
    public String report() {
        System.out.println("Hello report!");

        return "/WEB-INF/reportJsps/report";
    }

    @RequestMapping("/ireport")
    public String ireport() {
        System.out.println("Hello ireport!");

        return "/WEB-INF/reportJsps/ireport";
    }


    @RequestMapping("/hhreport/order")
    public String hhorder(HttpServletRequest request, HttpServletResponse response) {

        return "/WEB-INF/reportJsps/hhzs/order";
//        testOracle(request, response);
    }


    /**
     * 查看终端类型（PC/移动终端）
     *
     * @param header
     * @return
     */
    private boolean isMobile(String header) {
        String[] agents = new String[]{"Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"};

        for (String agent : agents) {
            if (header.indexOf(agent) > -1) {
                return true;
            }
        }

        return false;
    }


/*    public void testOracle(HttpServletRequest request, HttpServletResponse response){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.53:1521:orcl", "hhzs", "1qaz2wsx");

            File reportFile = new File(request.getServletContext().getRealPath("/WEB-INF/jasper/hhzs/Blank_A4.jasper"));

            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile);

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);

            HtmlExporter htmlExporter = new HtmlExporter();
            htmlExporter.setExporterInput(new SimpleExporterInput(jasperPrint));
            htmlExporter.setExporterOutput(new SimpleHtmlExporterOutput(response.getWriter()));
            htmlExporter.exportReport();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
}

<%@page import="java.io.OutputStream"%>
<%@ page contentType="application/pdf" %>

<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.design.JRDesignQuery"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%--
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
--%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page import="net.sf.jasperreports.engine.JasperReport"%>

<head>

<title>Insert title here</title>
</head>
<body>
 <%
		//コネクション取得
 		Connection m_con = null;
	  try {
	   // PDFフォーマットファイルを指定する
	   //File jrxmlFile = new File(application.getRealPath("kyujinkyusyoku_kyusyoku.jrxml")); //Vy del
	   File jrxmlFile = new File(application.getRealPath("VyTestReport.jrxml"));  //vy add
	   if(jrxmlFile.exists()){

	     //コネクション取得
/*	     Connection m_con = null;*/
	     //ここは各自の環境設定
	     String url = "jdbc:mysql://192.168.100.21:3306/kyujinkyusyoku?autoReconnect=true&useSSL=false";
	     String user = "inofex";
	     String password = "inofex";

	     //jdbcドライバをクラスパスに追加しておくこと
	     Class.forName("com.mysql.jdbc.Driver");
	     m_con = DriverManager.getConnection(url, user, password);
	 /*   //PDFに埋め込まれた変数に値を設定するためのパラメータ
	     HashMap<String, Object> params = new HashMap<String, Object>();
	     params.put("min_id", 3);
	 */
	     // jrxmlをコンパイルする
	     JasperReport jasperReport = JasperCompileManager.compileReport(jrxmlFile.getAbsolutePath());

	     // データソースとパラメータをコンパイルされた帳票に設定
	     /** 日本語が表示されない場合は Jaspersoft Studio上で
	     * 日本語が出ないオブジェクトのフォントが
	     *「IPAex」以外になっていないかチェック   */
	     JasperPrint pdf = JasperFillManager.fillReport(jasperReport, null, m_con);

	     // ブラウザ上にPDFを表示
 	     JasperExportManager.exportReportToPdfStream(pdf, response.getOutputStream());
 	     response.getOutputStream().flush();
 	     response.getOutputStream().close();

	   }else{
	     System.out.println("Not Find jrxml,jrxmlファイルが見つかりませんでした。");
	   }

	  } catch (Exception e) {
	   e.printStackTrace();
	  }

 %>
</body>
</html>
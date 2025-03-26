package com.sist.manager;

import java.io.File;
import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailManager {
   public static void main(String[] args) {
	   MailManager m=new MailManager();
	   m.mailSender("Hello");
   }
   private String style="<style>" + 
   		"body {" + 
   		"	  padding:1.5em;" + 
   		"	  background: #f5f5f5" + 
   		"	}" + 
   		"	table {" + 
   		"	  border: 1px #a39485 solid;" + 
   		"	  font-size: .9em;" + 
   		"	  box-shadow: 0 2px 5px rgba(0,0,0,.25);" + 
   		"	  width: 100%;" + 
   		"	  border-collapse: collapse;" + 
   		"	  border-radius: 5px;" + 
   		"	  overflow: hidden;" + 
   		"	}" + 
   		"	th {" + 
   		"	  text-align: left;" + 
   		"	}" + 
   		"	thead {" + 
   		"	  font-weight: bold;" + 
   		"	  color: #fff;" + 
   		"	  background: #73685d;" + 
   		"	}" + 
   		"	 td, th {" + 
   		"	  padding: 1em .5em;" + 
   		"	  vertical-align: middle;" + 
   		"	}" + 
   		"	 td {" + 
   		"	  border-bottom: 1px solid rgba(0,0,0,.1);" + 
   		"	  background: #fff;" + 
   		"	}" + 
   		"	a {" + 
   		"	  color: #73685d;" + 
   		"	}" + 
   		"	 @media all and (max-width: 768px) {" + 
   		"	  table, thead, tbody, th, td, tr {" + 
   		"	    display: block;" + 
   		"	  }" + 
   		"	  th {" + 
   		"	    text-align: right;" + 
   		"	  }" + 
   		"	  table {" + 
   		"	    position: relative; " + 
   		"	    padding-bottom: 0;" + 
   		"	    border: none;" + 
   		"	    box-shadow: 0 0 10px rgba(0,0,0,.2);" + 
   		"	  }" + 
   		"	  thead {" + 
   		"	    float: left;" + 
   		"	    white-space: nowrap;" + 
   		"	  }" + 
   		"	  tbody {" + 
   		"	    overflow-x: auto;" + 
   		"	    overflow-y: hidden;" + 
   		"	    position: relative;" + 
   		"	    white-space: nowrap;" + 
   		"	  }" + 
   		"	  tr {" + 
   		"	    display: inline-block;" + 
   		"	    vertical-align: top;" + 
   		"	  }" + 
   		"	  th {" + 
   		"	    border-bottom: 1px solid #a39485;" + 
   		"	  }" + 
   		"	  td {" + 
   		"	    border-bottom: 1px solid #e5e5e5;" + 
   		"	  }" + 
   		"	  }" + 
   		"</style>";
	public void mailSender(String result)
	{
		String data="";
		try
		{
			FileReader fr=new FileReader("c:\\pwd.txt");
			int i=0;
			while((i=fr.read())!=-1)
			{
				data+=String.valueOf((char)i);
			}
		}catch(Exception ex) {}
		
		String host="smtp.gmail.com"; 
		String user="bottleright10@gmail.com";
		String password=data;
		
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", "true");
		// naver 인증
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(user, password);
			}
			
		});
		try
		{
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("bottleright10@gmail.com"));
			message.setSubject("비밀번호입니다");
			String html = "<html>"
			        + "<head>"
			        + "<style>"
			        + "body { font-family: 'Arial', sans-serif; background: #f4f4f4; padding: 20px; }"
			        + ".container { max-width: 500px; margin: 0 auto; background: #ffffff; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); padding: 20px; }"
			        + "h2 { color: #333333; text-align: center; }"
			        + "table { width: 100%; border-collapse: collapse; margin-top: 20px; }"
			        + "th, td { text-align: left; padding: 12px; }"
			        + "th { background-color: #868EC7; color: white; width: 30%; }"
			        + "td { background-color: #f9f9f9; }"
			        + "</style>"
			        + "</head>"
			        + "<body>"
			        + "<div class='container'>"
			        + "<h2>비밀번호 안내</h2>"
			        + "<table>"
			        + "<tr>"
			        + "<th>비밀번호</th>"
			        + "<td>" + result + "</td>"
			        + "</tr>"
			        + "</table>"
			        + "<p style='text-align:center; margin-top:30px; font-size:0.9em; color:#777;'>"
			        + "비밀번호는 보안을 위해 로그인 후 반드시 변경해 주세요."
			        + "</p>"
			        + "</div>"
			        + "</body>"
			        + "</html>";
			message.setContent(html,"text/html;charset=UTF-8");
			//message.setContent(html,"text/html;charset=UTF-8");
			Transport.send(message);
			System.out.println("정상수행");
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("비정상수행");
		}
		
	}
}
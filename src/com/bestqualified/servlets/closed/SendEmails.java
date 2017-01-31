package com.bestqualified.servlets.closed;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bestqualified.util.Util;

public class SendEmails extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3716460991951035439L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String[] emails = req.getParameterValues("emails");
		String title = "The position you applied for has been closed";
		String body = "Hello, the position is closed";
		for(int i = 0; i < emails.length; i++) {
			try {
				Util.sendEmail(Util.SERVICE_ACCOUNT, emails[i], title, body);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}

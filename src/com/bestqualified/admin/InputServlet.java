package com.bestqualified.admin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.AssessmentQuestion;
import com.bestqualified.util.EntityConverter;
import com.google.appengine.api.datastore.EmbeddedEntity;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.datastore.Transaction;
import com.google.appengine.api.datastore.TransactionOptions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unused")
public class InputServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 568499766166628799L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		// response.setContentType("text/html");

		String category = request.getParameter("category").toUpperCase() ;
		String questionBody = request.getParameter("question-body");

		String altA = request.getParameter("alt-A-body");
		String altB = request.getParameter("alt-B-body");
		String altC = request.getParameter("alt-C-body");
		String altD = request.getParameter("alt-D-body");
		String altE = request.getParameter("alt-E-body");

		String correctAnswer = request.getParameter("correctAnswer");
		String explanation = request.getParameter("explanation");

		List<String> alts = new ArrayList<>();
		List<EmbeddedEntity> alternatives = new ArrayList<>();
		alts.add(altA);
		alts.add(altB);
		alts.add(altC);
		alts.add(altD);
		alts.add(altE);
		for(String s: alts) {
			EmbeddedEntity ee = new EmbeddedEntity();
			ee.setUnindexedProperty("text", s);
			if(s.equalsIgnoreCase(correctAnswer)) {
				ee.setUnindexedProperty("correct", true);
			}else {
				ee.setUnindexedProperty("correct", false);
			}
			alternatives.add(ee);
		}

		AssessmentQuestion aq = new AssessmentQuestion();


		aq.setCategory(category);
		aq.setBody(new Text(questionBody));
		aq.setAlternatives(alternatives);
		aq.setCorrectAnswer(correctAnswer);
		aq.setExplanation(new Text(explanation));

		Entity e = EntityConverter.AssessmentQuestionToEntity(aq);

		Transaction txn = GeneralController.ds
				.beginTransaction(TransactionOptions.Builder.withXG(true));

		List<Entity> ents = new ArrayList<>();
		ents.add(e);
		GeneralController.create(e);
		
		try {
			response.sendRedirect(response.encodeRedirectURL("/bq/save-question"));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	 
}
